*Build go sdk*
```
go get github.com/hyperledger/sawtooth-sdk-go
cd $GOPATH/src/github.com/hyperledger/sawtooth-sdk-go
go generate
```
Docker instructions
```
cd sawtooth-sdk-go
docker build . -t sawtooth-sdk-go
docker run -v $(pwd):/project/sawtooth-sdk-go sawtooth-sdk-go
```

Go generate will build the protos / mocks and place them in the protobuf or mocks directory respectively.

License
-------

Hyperledger Sawtooth software is licensed under the [Apache License Version 2.0](LICENSE) software license.

Hyperledger Sawtooth documentation in the [docs](docs) subdirectory is licensed under
a Creative Commons Attribution 4.0 International License.  You may obtain a copy of the
license at: http://creativecommons.org/licenses/by/4.0/.
