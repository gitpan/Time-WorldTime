# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}
use Time::WorldTime;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

# Ok, I'll put some darn tests in here

eval {
	if ($philip = new Time::WorldTime) {
                print "ok, loaded,", $test_num++, "\n";
                }
        else {
                print "NOT ok, loaded,", $test_num++, "\n";
                }
        if ($philip->now()) {
                print "ok, now,", $test_num++, "\n";
                }
        else {
                print "NOT ok, now,", $test_num++, "\n";
                }
	};

print "Mares eat oats and does eat oats but little lambs eat ivy.\n";
print "A kid would eat ivy too, wouldn't you?\n";
print "I'm ok anyway.\n";
print "ok 13\n";
