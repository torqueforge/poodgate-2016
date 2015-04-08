require "minitest/autorun"
require "active_record"
require_relative "../lib/cost_code_import"

class CostCodeTest < Minitest::Test
  def setup
    setup_database!
  end

  def test_csv_import
    csv = "Division,Cost Code,Description\n01,,Name\n01,01,Name\n"
    project = Project.create

    current_count = CostCode.count
    CostCodeImport.import(csv, project)

    assert_equal CostCode.count, current_count + 2
  end

  def test_csv_import_leaf_with_no_root_will_not_create
    csv = "Division,Cost Code,Description\n01,,Root\n02,01,Leaf no Root\n"
    project = Project.create

    current_count = CostCode.count
    errors = CostCodeImport.import(csv, project)

    assert_equal CostCode.count, current_count + 1
    assert_match /Couldn't find root/, errors.first[0]
  end

  def test_csv_import_with_no_description_creates_none
    csv = "Division,Cost Code,Description\n01,,\n"
    project = Project.create

    current_count = CostCode.count
    errors = CostCodeImport.import(csv, project)

    assert_equal CostCode.count, current_count + 0
    assert_match /Couldn't create CostCode/, errors.first[0]
  end
end


# Models
###
class CostCode < ActiveRecord::Base
  validates :code, presence: true
  validates :name, presence: true

  belongs_to :parent, class_name: CostCode
  belongs_to :biller, polymorphic: true

  def codes
    if parent
      parent.codes << code
    else
      [code]
    end
  end

  def full_code
    codes.join("-")
  end
end

class Project < ActiveRecord::Base
  has_many :cost_codes, as: :biller
end

# Test Helper Methods
###
def setup_database!
  ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

  {
    "cost_codes": "code STRING, name STRING, biller_type STRING, biller_id INTEGER, parent_id INTEGER",
    "projects": "name STRING"
  }.each do |table_name, columns_as_sql_string|
    ActiveRecord::Base.connection.execute "CREATE TABLE #{table_name} (id INTEGER NOT NULL PRIMARY KEY, #{columns_as_sql_string})"
  end
end

