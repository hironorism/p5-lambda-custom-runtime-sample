use strict;
use warnings;
use LWP::UserAgent;
sub handler {
    my $ua = LWP::UserAgent->new();
    my $res = $ua->get("http://$ENV{AWS_LAMBDA_RUNTIME_API}/2018-06-01/runtime/invocation/next");
    my $req_id = $res->header('Lambda-Runtime-Aws-Request-Id');
    $ua->post("http://$ENV{AWS_LAMBDA_RUNTIME_API}/2018-06-01/runtime/invocation/$req_id/response", Content => "Hello from Perl !!!!");
}

handler();
