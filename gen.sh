#!/bin/bash

# Copyright 2018 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------

if [ -f mocs ]; then
    rm -rf mocs
fi

if [ -d protobuf ]; then
    rm -rf protobuf
fi

mkdir -p  protobuf mocks/mock_messaging

# Generate protos
./protogen

# Update import paths on generated protos
repourl=github.com/hyperledger/sawtooth-sdk-go
grep -rl '"protobuf/' protobuf/ | while IFS= read -r file; do
    sed -i "s|\"protobuf/|\"${repourl}/protobuf/|" "$file"
done

(
cd messaging || exit
mockgen -source connection.go >../mocks/mock_messaging/connection.go
)
