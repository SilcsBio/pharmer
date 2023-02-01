
#### 1. Build `pharmer` program:
User needs to be in the `docker` group, or use `sudo` to run the script

```
./build.sh
```

or 

```
sudo ./build.sh
```

#### 2. Copy `pharmer` program:
Copy `pharmer` to `$SILCSBIODIR/programs` (needs write permission of the target folder)

```
./copy_pharmer.sh
```

or

```
sudo ./copy_pharmer.sh
```


---

```
The --help option will provide the following:

USAGE: pharmer [options] --cmd command [pharma, dbcreate, dbsearch, server]

OPTIONS:
  -bloom-large=<uint>  - Number of bits for coarse discretization fingerprint.
  -bloom-small=<uint>  - Number of bits for fine discretization fingerprint.
  -cmd=<string>        - command [pharma, dbcreate, dbsearch, server]
  -dbdir=<string>      - database directory(s)
  -extra-info          - Output additional molecular properties.  Slower.
  -file-partition      - Partion database slices based on files
  -help                - Display available options (--help-hidden for more)
  -in=<string>         - input file(s)
  -logdir=<string>     - log directory for server
  -max-hits=<n>        - return at most n results
  -max-orient=<n>      - return at most n orientations of each conformation
  -max-rmsd=<number>   - maximum allowed RMSD; default max allowed by query
  -max-weight=<uint>   - maximum allowed molecular weight
  -nthreads=<n>        - utilize n threads; default 1
  -out=<string>        - output file
  -pharmaspec=<string> - pharmacophore specification
  -port=<uint>         - port for server to listen on
  -print               - print results
  -q                   - quiet; suppress informational messages
  -reduceconfs=<n>     - return at most n conformations for each molecule
  -separate-weight     - Segregate database based on molecular weight
  -show-query          - print query points
  -sort-rmsd           - Sort results by RMSD.
  -unweighted-rmsd     - Compute minimal RMSD without radius weights

```
