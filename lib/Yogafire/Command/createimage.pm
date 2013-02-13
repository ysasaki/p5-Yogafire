package Yogafire::Command::createimage;
use Mouse;

extends qw(Yogafire::CommandBase);

has state => (
    traits        => [qw(Getopt)],
    isa           => "Str",
    is            => "rw",
    cmd_aliases   => "s",
    documentation => "specified instance status (running / stopped)",
);
has filter => (
    traits        => [qw(Getopt)],
    isa           => "Str",
    is            => "rw",
    cmd_aliases   => "f",
    documentation => "api filter. (ex.--filter='tag:keyname=value,instance-state-name=running')",
);
has force => (
    traits          => [qw(Getopt)],
    isa             => "Bool",
    is              => "rw",
    documentation   => "force execute.",
);
has name => (
    traits          => [qw(Getopt)],
    isa             => "Str",
    is              => "rw",
    documentation   => "The name of the image.",
);
has description => (
    traits          => [qw(Getopt)],
    isa             => "Str",
    is              => "rw",
    documentation   => "The description of the image.",
);
has noreboot => (
    traits          => [qw(Getopt)],
    isa             => "Str",
    is              => "rw",
    documentation   => "The instance will not be rebooted during the bundle process.",
);
has loop => (
    traits          => [qw(Getopt)],
    isa             => "Bool",
    is              => "rw",
    cmd_aliases     => "l",
    documentation   => "Repeat without exit interactive mode.",
);
no Mouse;

sub abstract {'EC2 Create Image'}
sub command_names {'create-image'}

sub usage {
    my ( $self, $opt, $args ) = @_;
    $self->{usage}->{leader_text} = 'yoga createimage [-?] <tagsname>';
    $self->{usage};
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $tagsname = $args->[0];
    $opt->{tagsname} = $tagsname if $tagsname;

    $self->action_process('createimage', $opt);
}

1;
