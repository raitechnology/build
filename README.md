# Build scripts

Typical usage patterns.

1. Clone the repos and build all the binaries.  This causes the repos to be
   symlinked instead of a recursive submodule checkout.  The symlink is turned
   back into a directory when necessary... for commit, status, etc.

```console
$ git clone https://github.com/raitechnology/build
$ cd build
$ make clone
$ make
```

2. Change something and add the change to the repo.


```console
$ cd raikv
$ touch a.new.file
$ git add a.new.file
$ cd ..
```

3. Bump the build number for all the changed repos.


```console
$ make bump
```

4. Check the status of any changes done.

```console
$ make status
```

5. Commit all of the changes.

```console
$ make commit
```

6. Push the repo changes to github.

```console
$ make push
```

7. Update the submodules to the most recent.  Sometimes changing a repo locally
   and committing will need to update a submodule version hash within other
   repos.  This extracts the repo hashes and updates the submodules if
   necessary.  Several rounds of this may be necessary if the submodule is
   linked within several trees which are in turn linked again in other trees.

```console
$ make update_submodules
$ make commit
$ make push
```

8. Trash the existing clones and start fresh.

```console
$ make clean
$ make clone
$ make
```

9. Pull updates for exiting clones.

```console
$ make pull
```

