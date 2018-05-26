use LWP::UserAgent;
use HTTP::Request;
use Win32::Console::ANSI;
use Term::ANSIColor;
use utf8;

system "cls";
print "[";
print colored "*",'bold blue';
print "] ";
print "INPUT WEBSITE: ";
$url = <STDIN>;
chomp($url);
print "\n";

@paths = ("admin/","adm/","admin/login/","adm/login/","wp-admin/","moderator/","administrador/","login/","webadmin/","adminarea/","admin.asp","administrador.asp","admin/index.asp","adm/index.asp","adminLogin/","bb-admin/","admin_area/","moderator/login.html","moderator/admin.html","account.html","controlpanel.html","admincontrol.html","admin_login.html","kpanel/","controlpanel");


foreach $path(@paths){

	$urlpath = $url.$path;
	$request = HTTP::Request->new(GET=>$urlpath);
	$ua = LWP::UserAgent->new();

	$response = $ua->request($request);
	if ($response->code() == 200){
		print "[";
		print colored "OK",'bold green';
		print "]: ";
		print "$path\n";
		sleep "1";
		open(save,">>founds.txt");
		print save "$urlpath\n";
		close(save);
	}else{
		print "[";
		print colored "FAIL",'bold red';
		print "]: ";
		print "$path\n";
		sleep "1";
	}

}
print "\n";
print colored "[ JURANDIR - by Arthur ]",'bold';