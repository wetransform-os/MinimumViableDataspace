#!/bin/bash
./gradlew build -x test
./gradlew -DuseFsVault="true" :launchers:connector:shadowJar
./gradlew -DuseFsVault="true" :launchers:registrationservice:shadowJar
./gradlew -DuseFsVault="true" :mocks:consumer-pull-backend-service:build
