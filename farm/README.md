# Old MacDonald Had a Farm

Update the code to add the 'silence' verse to
_Old MacDonald Had a Farm_.

### Test Suite

```lib/farm.rb``` contains the code for _Old MacDonald Had a Farm_.
A new requirement has been added and a new test has been written.
The new test is currently being skipped.

Your job is to make the skipped test pass.

The test suite can be run with the following command:

```plain
$ ruby test/farm_test.rb
```

```plain
$ ruby test/farm_test.rb --name test_pig_and_nothing_and_duck
```

### Lyrics

The lyrics allow a substitute animal and sound.
```plain
Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a [animal name], E-I-E-I-O,
With a [animal noise twice] here and a [animal noise twice] there
Here a [animal noise], there a [animal noise], everywhere a [animal noise twice]
Old MacDonald had a farm, E-I-E-I-O.
```

For example, a verse using a pig as an animal and “oink" as the pig's sound:
```plain
Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had a pig, E-I-E-I-O,
With an oink oink here and an oink oink there,
Here an oink, there an oink, everywhere an oink oink,
Old MacDonald had a farm, E-I-E-I-O.
```
