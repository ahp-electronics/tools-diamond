*******************************************************************************

vencrypt will encrypt Verilog and System Verilog source files into
IEEE Std 1735-2014 V1 and V2 decryption envelopes.

vhencrypt will encrypt VHDL source files into IEEE Std 1735-2014 V1 and V2
decryption envelopes.

*******************************************************************************

The following is a discussion of how to use the new command line options for
the vencrypt and vhencrypt tools.  These new command line options allow the user
to specify a "recipe" of how to construct each of the encryption envelope(s);
these encryption envelopes are used to produce the output decryption envelopes.
A recipe implies that V2 (version=2) is being used.

The recipe is contained in a set of files; these files are usually contained
in a "keyring" directory.

The recipe files comprise an optional "commonfile" file and a set of one or more
"keyfile" files; each keyfile file can optionally be associated with
a "rightsfile".

The recipe files are specified either via the command line or by the INI
file, or a combination of both.  The INI file is named "modelsim.ini"
and is the same file used by all the tools.

In the INI file, the [encryption] section is where the recipe can be defined.
Command line options always override those in the INI file.  

Files specified in these options as leaf pathnames are searched for in the
"keyring" directory.  The default location of "keyring" is in the installation
directory.  The "-keyring" command line option can be used to change the
location of this directory.

Files specified as absolute pathnames or with initial characters "./" or "../"
will be used as given, with no use of the "keyring" directory and/or the file
extensions that would normally apply.

Since the comma character ',' is used as a separator in the "-toolblock" option,
it is highly recommended that neither pathname specified there contains this
character.  The same restriction applies to the colon (':') character, which
is also used as a separator in the INI file-based "toolblock" specification.

Data Method
   -data_method=aes128|aes192|aes256
This option is used to specify the number of bits in the randomly-generated
session key used to encrypt the HDL text.
Each decryption envelope will have its text encrypted using its own session key
of this length.  This option will override the "data_method" found within a
commonfile.
Supported values are "aes128", "aes192", and "aes256".

Common File
   -common <commonfile>
This file specifies the recipe for the common portion of each encryption
envelope.  The protect directives in the commonfile include "author",
"author_info", "data_method", and any directives needed for the common block,
such as the license proxy specification directives, and any common rights
(via the "control" directive).  Any "begin_commonblock" and
"end_commonblock" directives, if present, will be ignored.

Tool Block
   -toolblock <keyfile>[,<rightsfile>]
This option specifies a recipe for a tool block that will appear in each
encryption envelope.
The keyfile is a file name with no extension; it contains the public key
specification.  (This public key is used to encrypt the session key.)
It is recommended that the file name reflect the "key_keyname" property
value within.  The keyfile will be searched for with one of two extensions,
in order, "deprecated" or "active".
The key file must contain the "rights_digest_method" protect directive, which
will have one of two possible values:
   "sha256"
   "sha512"
The key file may contain "control" directives for assigning rights, but these
are recommended to be in the rights file (the second, optional filename given).
If specified, the rights file contains any "control" directives (rights) that
pertain to the tool block being formed.
The tool block will be formed from the contents of these files.
Any "begin_toolblock" and "end_toolblock" directives, if present, will be
ignored.

Keyring
The "-keyring <directory path>" option specifies a different keyring directory
to use than the default.  This directory is a depository that contains the
various recipe files.  The default is the "keyring" directory in the
installation directory.


*******************************************************************************
**** Recipe File Conventions ***************************************************
*******************************************************************************

Some conventions must be followed for the specified recipe to produce expected
results.

Recipe files are meant to be language-neutral and therefore suitable for either
System Verilog (with its `pragma protect syntax) and VHDL (with its `protect
syntax).  These syntactical markers will be transformed into the correct
syntax for the language being encrypted.  Comments are allowed but must be
single-line comments beginning with either "//" or "--", independent of target
HDL language.

For a commonfile, if specified:

The IEEE Std. 1735 specifies that a common block is optional; but if any
"license()" or "license_string()" conditions are used in any "control" (rights)
directives in either the common block or in any tool block, then the common
block is required, and it must contain a license specification to allow
communication with the license proxy.  A license proxy is a separate program
provided by the IP author who requires authorization (i.e., the license() and/or
license_string() calls) before the IP can be used in the context of a particular
right.  This file should contain only these protect directives:
      author -- optional
      author_info -- optional
      data_method -- optional
      license_proxyname
      license_attributes
      license_keyowner
      license_keyname
      license_public_key
      license_public_key_method
      license_symmetric_key_method


For each toolblock:

1) For a relative <keyfile> specified, an effective keyfile is found from a
   search using a name constructed from the keyring directory, the key file
   name, and a file extension.
   There are two extensions used when searching for the effective key file in
   the keyring directory.
      a) .deprecated -- key has been deprecated (this will take precedence)
      b) .active -- key is recommended
   It is recommended but not necessary that the key file name be the same as
   the key_keyname value of the public key contained within it.  For example,
   here is the file <installation_dir>/keyring/MGC-VERIF-SIM-RSA-3.active:
      `protect begin_toolblock
      `protect key_keyowner = "Mentor Graphics Corporation"
      `protect key_keyname = "MGC-VERIF-SIM-RSA-3"
      `protect key_method = "rsa"
      `protect rights_digest_method="sha256"
      `protect key_public_key
      MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1hm/RxfJSXLzWIpTJWdyCDFXo
      bHK1nLmxQCqPK9jjEY+cUgX90lstOWPfCljl3dMOnDNkCS1+owUAiVHCXZGa/agP
      gq77ioheQgXpY2kViTdgjdsjoWTIYt2ROpRO0BmJRGpXc1wT9GoFH2MYjomhNqd7
      jELfuwfMUnUAft0zXQIDAQAB
      `protect end_toolblock
   This is in VHDL syntax (`protect) but will work in the "vencrypt" tool
   because it will be translated to System Verilog (`pragma protect).
   It can be used in conjunction with a rights file since the begin_toolblock
   and end_toolblock will be ignored.
   The file name "MGC-VERIF-SIM-RSA-3.active" is based on the value of the
   "key_keyname" directive.

2) The effective keyfile shall contain only those protect directives that are
   germane to the specification of the key, along with the rights_digest_method
   directive.  That is, this file should contain only these protect directives:
      key_keyowner -- required
      key_keyname -- required
      key_method -- required
      key_block -- optional, a relic of V1, it has no meaning in V1 or V2
      key_public_key -- required if the public key is not a known key
      rights_digest_method -- required (valid values are "sha256" and "sha512")
      control -- optional; not recommended in a keyfile (use a rightsfile)
   In particular, it is recommended that any tool-specific rights ("control"
   directives) be placed into a separate file and referenced via the second
   part of the "-toolblock" option.

3) If a rightsfile is specified, it may contain only "control" directives.
   It is used to define the rights that will appear in the tool block.
