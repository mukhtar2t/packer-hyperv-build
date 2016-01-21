# Packer HyperV Build
Builds a container which builds the latest version of Packer with the pull request #2576 (HyperV Implementation)

## To extract the required builder
```
    docker build -t packer:hyperv .
    docker run --name packer-hyperv -d packer:hyperv bash
    docker cp packer-hyperv:/go/src/github.com/mitchellh/packer/pkg .
```
