import io;

if exists "nopenotmedontexist.txt",
  print "ERROR! File that should not exist is said to exist\n";

if not exists "io_exists.g",
  print "ERROR! File that should exist is said not to exist\n";

0;
