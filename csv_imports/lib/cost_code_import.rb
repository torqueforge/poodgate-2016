require "csv"

class CostCodeImport
  def self.import(csv, provider)
    roots = []
    errors = []

    CSV.parse(csv, headers: true) do |row|
      major = row["Division"].strip    if row["Division"]
      minor = row["Cost Code"].strip   if row["Cost Code"]
      name  = row["Description"].strip if row["Description"]


      next if [major, minor, name].all?{|f| f.blank?}

      new_hash = {
        code: major,
        name: name,
        biller_type: provider.class.to_s,
        biller_id: provider.id
      }

      if minor.blank?
        new_root = ::CostCode.new(new_hash)
        unless new_root.save
          errors << [
            "Couldn't create CostCode #{new_hash.inspect}, #{new_root.errors.full_messages}",
            new_root
          ]
          break
        end

        roots << new_root
        next
      end

      root = roots.find{|ccs| ccs.code.to_s == major}
      unless root
        errors << ["Couldn't find root for #{row.inspect}", row]
        break
      end

      # Set up hash for new leaf cost code
      new_hash[:code] = minor

      new_cc = ::CostCode.new(new_hash)
      new_cc.parent = root
      unless new_cc.save
        errors << ["Couldn't create new CostCode: #{new_hash.inspect} because #{new_cc.errors.full_messages}", new_cc]
      end
    end

    errors
  end
end
