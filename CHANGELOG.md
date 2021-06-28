# [1.10.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.9.0...v1.10.0) (2021-06-28)


### Features

* **apis:** renamed batch_sink to sink ([ba7b5e7](https://gitlab.com/stream-machine/api-definitions/commit/ba7b5e72206c713fb0d098e462e083d4ecffd133))

# [1.9.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.8.0...v1.9.0) (2021-06-28)


### Features

* introduce ref everywhere; misc ([c8a0fa6](https://gitlab.com/stream-machine/api-definitions/commit/c8a0fa68750d7dc7b273a654a740fc9d2a3703ac))

# [1.8.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.7.0...v1.8.0) (2021-06-25)


### Features

* combined all stream limits into a limit message ([aba8db4](https://gitlab.com/stream-machine/api-definitions/commit/aba8db4aa0bb76cc68df54c2b644e5f64659b2b0))


### Reverts

* revert disable buf breaking ([55ae741](https://gitlab.com/stream-machine/api-definitions/commit/55ae74138b153fcc85062299116613a41080bcfc))

# [1.7.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.6.0...v1.7.0) (2021-06-24)


### Features

* rename value to level for consistency ([1c3b1d2](https://gitlab.com/stream-machine/api-definitions/commit/1c3b1d209529c8163e7f1772bc9d0ad030dc5458))

# [1.6.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.5.0...v1.6.0) (2021-06-21)


### Features

* **apis:** move and renamed combined rpc ([c86b351](https://gitlab.com/stream-machine/api-definitions/commit/c86b35185f01a1fb2e4aae7561a86959bc7128cc))

# [1.5.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.4.0...v1.5.0) (2021-06-18)


### Features

* **apis:** fixed all AIP lint errors ([7871b83](https://gitlab.com/stream-machine/api-definitions/commit/7871b835a96cfedb42e0d4ac98f3a372b15f2973))
* **field_behavior:** added non-optional field_behavior to messages ([0d9f506](https://gitlab.com/stream-machine/api-definitions/commit/0d9f50643308d22d710ae610227e6b8126004d2d))
* add api linter scripts and comply to Google AIP rules ([7948e84](https://gitlab.com/stream-machine/api-definitions/commit/7948e84d3cebd9163ce507b6f6ad78dcd8954f70))
* refactoring and renaming v1 ([f5bbf4d](https://gitlab.com/stream-machine/api-definitions/commit/f5bbf4dac4cd7bc384fd4c004dde26a9f28df953))

# [1.4.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.3.0...v1.4.0) (2021-06-16)


### Bug Fixes

* **go:** remove duplicate api in go package ([7ea232e](https://gitlab.com/stream-machine/api-definitions/commit/7ea232e0fce262fef1045b25e31f0f78dc9c462b))


### Features

* **apis:** cleanup of the protos ([771f178](https://gitlab.com/stream-machine/api-definitions/commit/771f178fb43e40f032e5800f94e882e5aaff5f4e))

# [1.3.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.2.1...v1.3.0) (2021-06-14)


### Features

* **chore:** renamed project to api-definitions ([2098d55](https://gitlab.com/stream-machine/api-definitions/commit/2098d55dd784dd8e3cb66784b2c402485a334a2b))

## [1.2.1](https://gitlab.com/stream-machine/api-definitions/compare/v1.2.0...v1.2.1) (2021-06-09)


### Bug Fixes

* **kafka-user:** added optional KafkaUser to KafkaExporter create response ([aa4a47c](https://gitlab.com/stream-machine/api-definitions/commit/aa4a47c3f90058bc2a813f6831880e8b8b3c0b35))

# [1.2.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.1.0...v1.2.0) (2021-06-07)


### Features

* **golang:** builds complete strm api in protos/build ([5b6b401](https://gitlab.com/stream-machine/api-definitions/commit/5b6b4014dc3f4f8b56032e273c52bf554d5923a3))
* **golang:** go_packages being built ([687ecae](https://gitlab.com/stream-machine/api-definitions/commit/687ecae47492a8b1b49bdbf5975170dbc01dcdb4))

# [1.1.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.0.1...v1.1.0) (2021-06-01)


### Features

* **internal-api:** streams list by streamrefs ([ad926be](https://gitlab.com/stream-machine/api-definitions/commit/ad926be57e08951e5f971cca59eda84885fc40ff))

## [1.0.1](https://gitlab.com/stream-machine/api-definitions/compare/v1.0.0...v1.0.1) (2021-05-28)


### Bug Fixes

* fix the damn ci ([e36c25b](https://gitlab.com/stream-machine/api-definitions/commit/e36c25b361485a2469376cb390c836733376810b))

# 1.0.0 (2021-05-28)


### Bug Fixes

* trying to trigger the ci release ([9ec4cf9](https://gitlab.com/stream-machine/api-definitions/commit/9ec4cf99fa20e4dd4a5ec00f4438cd084bb3d089))
* **ci:** trying to create a valid release ([f412ef5](https://gitlab.com/stream-machine/api-definitions/commit/f412ef5f58b7380e1925946514e2def5832c045e))
* buf lint fix ([62969a0](https://gitlab.com/stream-machine/api-definitions/commit/62969a0995874e3b2a8be2299ec721d10963e06e))
* try to trigger the ci ([91392be](https://gitlab.com/stream-machine/api-definitions/commit/91392befa1c3ba45c9a42dde14c4c63595fede00))
* wrong package name internal entities ([0fa9594](https://gitlab.com/stream-machine/api-definitions/commit/0fa9594f8949de7f8a6ef5fa445ef434cdf52cc8))


### Features

* fix ci ([8087c76](https://gitlab.com/stream-machine/api-definitions/commit/8087c76dc3bf8651628821ccaad93881ed4e1785))
* **batch-exporters:** batchExporterExt has sourceStream property ([8e2efea](https://gitlab.com/stream-machine/api-definitions/commit/8e2efea6138f912ba27c52d15839bafa98c86cfc))
* **batch-exporters:** removed duplicate source_stream from BatchExporter entity ([053c185](https://gitlab.com/stream-machine/api-definitions/commit/053c1859dbc9f1ef922dcc99ca9b1e58a36dffad))
* **clientids:** needs pairs of billing_id/client_id ([8933c79](https://gitlab.com/stream-machine/api-definitions/commit/8933c794ca7b9267df8833d0561809265e88973c))
* first release ([9588488](https://gitlab.com/stream-machine/api-definitions/commit/95884880d3f6946f2b84b6969756e8d764593e01))
* **chore:** added build to gitignore ([34504df](https://gitlab.com/stream-machine/api-definitions/commit/34504df2d19b24658ae7108835623298bda77168))
* **event-contracts:** added event contract message as used by all code ([b79fe7c](https://gitlab.com/stream-machine/api-definitions/commit/b79fe7cbd744918dc0391b1c917970e2778e099b))
* **kafka-cluster:** owned added ([791b302](https://gitlab.com/stream-machine/api-definitions/commit/791b30208ba392c3c61bc0d0b3f437bd9d63a625))
* **kafka-exporters:** changes around kafka-exporters ([6ea649f](https://gitlab.com/stream-machine/api-definitions/commit/6ea649fbe517e34ce2d68c06dae29da6b6c75a2d))
* **kafka-exporters:** wIP kafka exporters and users ([f321c59](https://gitlab.com/stream-machine/api-definitions/commit/f321c59be3c62dd06bdf980e94a41733c09f948e))
* **private entities:** decrypterExt added ([d47cac7](https://gitlab.com/stream-machine/api-definitions/commit/d47cac7181b0705f5042a72be79cbcae7e67fdd7))
* **schema-server:** migrated schema-server ([4465fda](https://gitlab.com/stream-machine/api-definitions/commit/4465fda488a8cfdeaacc9e4ab85d26ede64f1a30))
* **sinks:** sinkExt entity ([f066c8f](https://gitlab.com/stream-machine/api-definitions/commit/f066c8fb9c061c5173a97eff7885855e6916fa17))
* **streams-admin:** added service ([6d4a6f9](https://gitlab.com/stream-machine/api-definitions/commit/6d4a6f9dd0280e43b7ef2a582d6bc4647b7b96fb))
* 0.1.1 ([8edb89a](https://gitlab.com/stream-machine/api-definitions/commit/8edb89ac094d94f0afa7f952dc2e8a5978b4f859))
* added all services from wiki ([90b7751](https://gitlab.com/stream-machine/api-definitions/commit/90b77517ec72ddef79652c1493f8cf518f2880c7))
* copy of internal-apis [skip ci] ([092687c](https://gitlab.com/stream-machine/api-definitions/commit/092687cd90ded96205047601e90074a0353a7a81))
* first review ([9f58751](https://gitlab.com/stream-machine/api-definitions/commit/9f58751ae34aa331a4ab8dd5527c9f9cef5851b5))
* removed unnecessary full paths ([e40d04b](https://gitlab.com/stream-machine/api-definitions/commit/e40d04b9ce149ab63a8f89529823e195c3e00f47))
* **stream:** streamExt added ([88ab2d6](https://gitlab.com/stream-machine/api-definitions/commit/88ab2d6cb5a1e283d85a85a9cea25ccdfdeefb23))
* first full review ([6f9b697](https://gitlab.com/stream-machine/api-definitions/commit/6f9b6979d55da4d3be19c6476fa15e2657ede584))
* some changes ([6e46c3c](https://gitlab.com/stream-machine/api-definitions/commit/6e46c3c1c43ac1c306377aa2a25aac2cada7756c))
* **streams:** added credentials to Stream entity ([7e394f2](https://gitlab.com/stream-machine/api-definitions/commit/7e394f28d26eeb4506aaf0dc7ebb3c8593be557e))
* **streams:** created entities and streams service ([3d42352](https://gitlab.com/stream-machine/api-definitions/commit/3d42352d25c5cf662a12664004c79f602c6ba173))

# 1.0.0 (2021-05-26)


### Bug Fixes

* trying to trigger the ci release ([9ec4cf9](https://gitlab.com/stream-machine/api-definitions/commit/9ec4cf99fa20e4dd4a5ec00f4438cd084bb3d089))
* **ci:** trying to create a valid release ([f412ef5](https://gitlab.com/stream-machine/api-definitions/commit/f412ef5f58b7380e1925946514e2def5832c045e))
* buf lint fix ([62969a0](https://gitlab.com/stream-machine/api-definitions/commit/62969a0995874e3b2a8be2299ec721d10963e06e))
* try to trigger the ci ([91392be](https://gitlab.com/stream-machine/api-definitions/commit/91392befa1c3ba45c9a42dde14c4c63595fede00))
* wrong package name internal entities ([0fa9594](https://gitlab.com/stream-machine/api-definitions/commit/0fa9594f8949de7f8a6ef5fa445ef434cdf52cc8))


### Features

* first release ([9588488](https://gitlab.com/stream-machine/api-definitions/commit/95884880d3f6946f2b84b6969756e8d764593e01))
* **batch-exporters:** batchExporterExt has sourceStream property ([8e2efea](https://gitlab.com/stream-machine/api-definitions/commit/8e2efea6138f912ba27c52d15839bafa98c86cfc))
* **batch-exporters:** removed duplicate source_stream from BatchExporter entity ([053c185](https://gitlab.com/stream-machine/api-definitions/commit/053c1859dbc9f1ef922dcc99ca9b1e58a36dffad))
* **chore:** added build to gitignore ([34504df](https://gitlab.com/stream-machine/api-definitions/commit/34504df2d19b24658ae7108835623298bda77168))
* **event-contracts:** added event contract message as used by all code ([b79fe7c](https://gitlab.com/stream-machine/api-definitions/commit/b79fe7cbd744918dc0391b1c917970e2778e099b))
* **kafka-cluster:** owned added ([791b302](https://gitlab.com/stream-machine/api-definitions/commit/791b30208ba392c3c61bc0d0b3f437bd9d63a625))
* **kafka-exporters:** changes around kafka-exporters ([6ea649f](https://gitlab.com/stream-machine/api-definitions/commit/6ea649fbe517e34ce2d68c06dae29da6b6c75a2d))
* **kafka-exporters:** wIP kafka exporters and users ([f321c59](https://gitlab.com/stream-machine/api-definitions/commit/f321c59be3c62dd06bdf980e94a41733c09f948e))
* **private entities:** decrypterExt added ([d47cac7](https://gitlab.com/stream-machine/api-definitions/commit/d47cac7181b0705f5042a72be79cbcae7e67fdd7))
* **schema-server:** migrated schema-server ([4465fda](https://gitlab.com/stream-machine/api-definitions/commit/4465fda488a8cfdeaacc9e4ab85d26ede64f1a30))
* **sinks:** sinkExt entity ([f066c8f](https://gitlab.com/stream-machine/api-definitions/commit/f066c8fb9c061c5173a97eff7885855e6916fa17))
* **streams-admin:** added service ([6d4a6f9](https://gitlab.com/stream-machine/api-definitions/commit/6d4a6f9dd0280e43b7ef2a582d6bc4647b7b96fb))
* removed unnecessary full paths ([e40d04b](https://gitlab.com/stream-machine/api-definitions/commit/e40d04b9ce149ab63a8f89529823e195c3e00f47))
* **stream:** streamExt added ([88ab2d6](https://gitlab.com/stream-machine/api-definitions/commit/88ab2d6cb5a1e283d85a85a9cea25ccdfdeefb23))
* 0.1.1 ([8edb89a](https://gitlab.com/stream-machine/api-definitions/commit/8edb89ac094d94f0afa7f952dc2e8a5978b4f859))
* added all services from wiki ([90b7751](https://gitlab.com/stream-machine/api-definitions/commit/90b77517ec72ddef79652c1493f8cf518f2880c7))
* copy of internal-apis [skip ci] ([092687c](https://gitlab.com/stream-machine/api-definitions/commit/092687cd90ded96205047601e90074a0353a7a81))
* first full review ([6f9b697](https://gitlab.com/stream-machine/api-definitions/commit/6f9b6979d55da4d3be19c6476fa15e2657ede584))
* first review ([9f58751](https://gitlab.com/stream-machine/api-definitions/commit/9f58751ae34aa331a4ab8dd5527c9f9cef5851b5))
* some changes ([6e46c3c](https://gitlab.com/stream-machine/api-definitions/commit/6e46c3c1c43ac1c306377aa2a25aac2cada7756c))
* **streams:** added credentials to Stream entity ([7e394f2](https://gitlab.com/stream-machine/api-definitions/commit/7e394f28d26eeb4506aaf0dc7ebb3c8593be557e))
* **streams:** created entities and streams service ([3d42352](https://gitlab.com/stream-machine/api-definitions/commit/3d42352d25c5cf662a12664004c79f602c6ba173))

# 1.0.0 (2021-05-26)


### Bug Fixes

* buf lint fix ([62969a0](https://gitlab.com/stream-machine/api-definitions/commit/62969a0995874e3b2a8be2299ec721d10963e06e))
* wrong package name internal entities ([0fa9594](https://gitlab.com/stream-machine/api-definitions/commit/0fa9594f8949de7f8a6ef5fa445ef434cdf52cc8))


### Features

* **batch-exporters:** batchExporterExt has sourceStream property ([8e2efea](https://gitlab.com/stream-machine/api-definitions/commit/8e2efea6138f912ba27c52d15839bafa98c86cfc))
* **batch-exporters:** removed duplicate source_stream from BatchExporter entity ([053c185](https://gitlab.com/stream-machine/api-definitions/commit/053c1859dbc9f1ef922dcc99ca9b1e58a36dffad))
* **chore:** added build to gitignore ([34504df](https://gitlab.com/stream-machine/api-definitions/commit/34504df2d19b24658ae7108835623298bda77168))
* **event-contracts:** added event contract message as used by all code ([b79fe7c](https://gitlab.com/stream-machine/api-definitions/commit/b79fe7cbd744918dc0391b1c917970e2778e099b))
* **kafka-cluster:** owned added ([791b302](https://gitlab.com/stream-machine/api-definitions/commit/791b30208ba392c3c61bc0d0b3f437bd9d63a625))
* **kafka-exporters:** changes around kafka-exporters ([6ea649f](https://gitlab.com/stream-machine/api-definitions/commit/6ea649fbe517e34ce2d68c06dae29da6b6c75a2d))
* **kafka-exporters:** wIP kafka exporters and users ([f321c59](https://gitlab.com/stream-machine/api-definitions/commit/f321c59be3c62dd06bdf980e94a41733c09f948e))
* **private entities:** decrypterExt added ([d47cac7](https://gitlab.com/stream-machine/api-definitions/commit/d47cac7181b0705f5042a72be79cbcae7e67fdd7))
* **schema-server:** migrated schema-server ([4465fda](https://gitlab.com/stream-machine/api-definitions/commit/4465fda488a8cfdeaacc9e4ab85d26ede64f1a30))
* **sinks:** sinkExt entity ([f066c8f](https://gitlab.com/stream-machine/api-definitions/commit/f066c8fb9c061c5173a97eff7885855e6916fa17))
* **streams-admin:** added service ([6d4a6f9](https://gitlab.com/stream-machine/api-definitions/commit/6d4a6f9dd0280e43b7ef2a582d6bc4647b7b96fb))
* removed unnecessary full paths ([e40d04b](https://gitlab.com/stream-machine/api-definitions/commit/e40d04b9ce149ab63a8f89529823e195c3e00f47))
* **stream:** streamExt added ([88ab2d6](https://gitlab.com/stream-machine/api-definitions/commit/88ab2d6cb5a1e283d85a85a9cea25ccdfdeefb23))
* 0.1.1 ([8edb89a](https://gitlab.com/stream-machine/api-definitions/commit/8edb89ac094d94f0afa7f952dc2e8a5978b4f859))
* added all services from wiki ([90b7751](https://gitlab.com/stream-machine/api-definitions/commit/90b77517ec72ddef79652c1493f8cf518f2880c7))
* copy of internal-apis [skip ci] ([092687c](https://gitlab.com/stream-machine/api-definitions/commit/092687cd90ded96205047601e90074a0353a7a81))
* first full review ([6f9b697](https://gitlab.com/stream-machine/api-definitions/commit/6f9b6979d55da4d3be19c6476fa15e2657ede584))
* first review ([9f58751](https://gitlab.com/stream-machine/api-definitions/commit/9f58751ae34aa331a4ab8dd5527c9f9cef5851b5))
* some changes ([6e46c3c](https://gitlab.com/stream-machine/api-definitions/commit/6e46c3c1c43ac1c306377aa2a25aac2cada7756c))
* **streams:** added credentials to Stream entity ([7e394f2](https://gitlab.com/stream-machine/api-definitions/commit/7e394f28d26eeb4506aaf0dc7ebb3c8593be557e))
* **streams:** created entities and streams service ([3d42352](https://gitlab.com/stream-machine/api-definitions/commit/3d42352d25c5cf662a12664004c79f602c6ba173))
