package Time::WorldTime;
use strict;
use vars qw($VERSION);

$VERSION = '1.00';

# IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY FOR DIRECT,
# INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF
# THIS SOFTWARE, ITS DOCUMENTATION, OR ANY DERIVATIVES THEREOF, EVEN IF THE
# AUTHORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES, INCLUDING,
# BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE, AND NON-INFRINGEMENT. THIS SOFTWARE IS PROVIDED ON AN ``AS
# IS'' BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE NO OBLIGATION TO PROVIDE
# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

sub new {

        my $proto = shift;
        my $class = ref($proto) || $proto;
        my $self  = {};
        bless ($self, $class);
        return $self;

        } 

sub now {

	my ($self,%args) = @_;

	# get time in GMT
	my ($sec,$min,$hour) = (gmtime)[0,1,2];

	# calculate internet time:
	my $itime = (($hour * 3600 + (($min + 60) * 60) + $sec) * 1000 / 86400);

	# make it look right
	if ($itime >= 1000) {
		$itime -= 1000;
		}
	elsif ($itime < 0) {
		$itime += 1000;
		}

	# crude drop of anything after the decimal
	$itime =~ s/(.*)\..*/$1/;

	# put the @ infront unless told not to
	unless ($args{'FORMAT'} eq 'NOAT') {
		$itime = "@" . $itime;
		}

	return $itime;

	}

1;

__END__

=head1 NAME


Time::WorldTime - object class for getting the new universal time


=head1 SYNOPSIS

 use Time::WorldTime;

 # Initialization statement
 my $wt = new Time::WorldTime;

 $worldtime = $wt->now; # return string containing world time
 $worldtime = $wt->now(FORMAT => 'NOAT') ; # return world time
				 	   # without @

=head1 DESCRIPTION

World Time?

World Time, aka Swatch's Internet Time represents a new global 
concept of time. 

Swatch has divided up the virtual and real day into 1000 "beats". 
One Swatch beat is the equivalent of 1 minute 26.4 seconds. That 
means that 12 noon in the old time system is the equivalent of @500 
Swatch beats. Find out more at http://www.swatch.com.

For this module to report the correct time, your machines
time must be set. (Hey, you would be suprised how many people 
wouldn't think about that. ;) )

=head1 AUTHOR

Philip Mikal, http://mikal.org. Philip Mikal is an Internet 
technology consultant based in Silicon Valley.

=head1 SEE ALSO

perl(1).

=cut
