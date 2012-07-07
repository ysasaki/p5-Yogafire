package Yogafire::Command::start;
use Mouse;

extends qw(Yogafire::Command Yogafire::CommandAttribute);

has state => (
    traits          => [qw(Getopt)],
    isa             => "Str",
    is              => "rw",
    cmd_aliases     => "s",
    documentation   => "specified instance status (running / stopped)",
);
has filter => (
    traits          => [qw(Getopt)],
    isa             => "Str",
    is              => "rw",
    cmd_aliases     => "f",
    documentation   => "api filter. (ex.--filter='tag:keyname=value,instance-state-name=running')",
);
has force => (
    traits          => [qw(Getopt)],
    isa             => "Str",
    is              => "rw",
    documentation   => "force execute.",
);
no Mouse;

sub abstract {'EC2 Start Instances'}

sub usage {
    my ( $self, $opt, $args ) = @_;
    $self->{usage}->{leader_text} = 'yoga start [-?] <tagsname>';
    $self->{usage}->text;
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $tagsname = $args->[0];
    $opt->{tagsname} = $tagsname if $tagsname;

    $self->action_process('start', $opt);
}

1;