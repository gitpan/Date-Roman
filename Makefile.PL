use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
{
  package MY;

  sub manifypods {

    my ($self,%attribs) = @_;
    my $result = $self->SUPER::manifypods(%attribs);
    $result =~ s/^(POD2MAN_EXE\s*=\s*)(.+)$/$1$2 -r "v. $self->{VERSION}" -d "\$(REVISION_DATE)"/m;
    return $result;
  }
}

WriteMakefile(
    'NAME'		=> 'Date::Roman',
    'VERSION_FROM'	=> 'lib/Date/Roman.pm', # finds $VERSION
    'PREREQ_PM'		=> {Roman => 0, #Needed to use Roman numbering
			   Test::More => 0, #Used in test files
			   }, 
    'macro'             => {REVISION_DATE => 'a.d. XI Kal. Mai. MMDCCLV AUC'},
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Date/Roman.pm', # retrieve abstract from module
       AUTHOR     => 'Leo Cacciari aka TheHobbit <thehobbit@altern.org>') : ()),
);

