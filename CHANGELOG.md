# [1.30.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.29.0...v1.30.0) (2021-11-05)


### Features

* simple schema definition ([84a081a](https://gitlab.com/stream-machine/api-definitions/commit/84a081af63b2e3bdd9df0b0d1481a9c00663e27b))

# [1.29.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.28.0...v1.29.0) (2021-11-04)


### Features

* kotlin DSL ([3706de1](https://gitlab.com/stream-machine/api-definitions/commit/3706de1da504e89cfd8234148d04f30e97cc1e92))

# [1.28.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.27.0...v1.28.0) (2021-11-01)


### Features

* billing with Stripe ([1e239ca](https://gitlab.com/stream-machine/api-definitions/commit/1e239ca972eadb9fbb9381b507b6ce890350aade))

# [1.27.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.26.0...v1.27.0) (2021-10-29)


### Features

* api-linter ([8b00895](https://gitlab.com/stream-machine/api-definitions/commit/8b00895b1eaf9a79868f6ef378b4410e5b19f478))
* **masked-fields:** added ValidateMaskedFields to event contract service ([1d6d1b2](https://gitlab.com/stream-machine/api-definitions/commit/1d6d1b2f7d36534fc3cd7739abc564c420ef0f79))

# [1.26.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.25.0...v1.26.0) (2021-10-22)


### Bug Fixes

* **ORB-231:** fix linter issue around proto docs ([97f8055](https://gitlab.com/stream-machine/api-definitions/commit/97f80558ea5088612c8c3ad0e7370689a9e43b43))
* **ORB-231:** single MaskedField message for json serialization ([bdfe713](https://gitlab.com/stream-machine/api-definitions/commit/bdfe7131938f20f3b2b7596a34597c0fcc4a4620))


### Features

* **ORB-231:** added masked_fields attribute to Stream entity ([e7b3392](https://gitlab.com/stream-machine/api-definitions/commit/e7b33929b482f39329248ed23dae2e1b8b5733ab))
* **ORB-231:** extended stream group added ([36e5d99](https://gitlab.com/stream-machine/api-definitions/commit/36e5d992dac85294aba8c08b8dfb194dbf27177e))
* **streams:** added masked_fields attribute ([0c750d7](https://gitlab.com/stream-machine/api-definitions/commit/0c750d7366d22c77c7138fff3671916123f56c71))

# [1.25.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.24.0...v1.25.0) (2021-10-14)


### Features

* add assume_role_arn for AWS multi-account setups ([f464ac8](https://gitlab.com/stream-machine/api-definitions/commit/f464ac80839288bda9eda7481ca2a179d0c8d096))

# [1.24.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.23.0...v1.24.0) (2021-10-12)


### Features

* **quotas-api:** rename key_streams to encryption_key_streams_allowed ([fadee51](https://gitlab.com/stream-machine/api-definitions/commit/fadee51c9cb82050d75867bcb07559da2002d9b6))
* **quotas-api:** use legacy billing id for now, as we don't have external user id everywhere ([5f5d26e](https://gitlab.com/stream-machine/api-definitions/commit/5f5d26e0cb877defab283f34633602265cb7956e))
* rename max_total_events to be clear about timeframe ([7b8f822](https://gitlab.com/stream-machine/api-definitions/commit/7b8f82251fc5aa5507d9f9b8178c1a64d895b12b))
* **quotas-api:** modify the response message ([241902a](https://gitlab.com/stream-machine/api-definitions/commit/241902a00a0ce62dfd8c3b1b112e8348b4ffb6ae))
* add quotas api ([9a291a4](https://gitlab.com/stream-machine/api-definitions/commit/9a291a4fcebb068d90d70b7acb9dada589eea16c))

# [1.23.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.22.0...v1.23.0) (2021-10-01)


### Bug Fixes

* build ([b9720f7](https://gitlab.com/stream-machine/api-definitions/commit/b9720f72a18696e0448067871b50ac66bffd752f))
* build ([c0741ca](https://gitlab.com/stream-machine/api-definitions/commit/c0741ca57d49e20b1687bef1b9db63a1af07f824))
* build ([23bda01](https://gitlab.com/stream-machine/api-definitions/commit/23bda0137dd34b7f123df2e3e34bcba0cb5668f6))
* build ([6bbe1f4](https://gitlab.com/stream-machine/api-definitions/commit/6bbe1f4c8e1b3a3e57b686c027c44e5a1e55521d))
* build ([abd75cb](https://gitlab.com/stream-machine/api-definitions/commit/abd75cbe0a43ff12c264d16572683d34e9166000))
* build ([af6300a](https://gitlab.com/stream-machine/api-definitions/commit/af6300aab1ee0a6802763300ff90012e6911fdb3))
* build ([6446816](https://gitlab.com/stream-machine/api-definitions/commit/6446816d955860f017386cd7307c73231466b18d))
* needs ([c2719a3](https://gitlab.com/stream-machine/api-definitions/commit/c2719a3b5845447a950a584f2b96811c94d0ec15))
* needs ([37cde49](https://gitlab.com/stream-machine/api-definitions/commit/37cde49e03fb7f46b4cd799c4e9949f8717de7fb))
* needs ([e80cf1a](https://gitlab.com/stream-machine/api-definitions/commit/e80cf1aba2e8fdd5cbd6e835ba38a171b6834749))
* needs ([5280ba6](https://gitlab.com/stream-machine/api-definitions/commit/5280ba6f35e05321a441350ab5cf8ba9ae9d755b))
* needs ([6eafec1](https://gitlab.com/stream-machine/api-definitions/commit/6eafec12d8cee692a640170a1f2c01756e02072e))
* needs ([ef3e9d4](https://gitlab.com/stream-machine/api-definitions/commit/ef3e9d4ed853ff18807af7526c497d74c419a604))
* only ts ([6fad8da](https://gitlab.com/stream-machine/api-definitions/commit/6fad8dac896e0995e66471ff7a8e0005694b5727))
* only ts ([5efad18](https://gitlab.com/stream-machine/api-definitions/commit/5efad189a900435a68742685399d4e4ae3ea5c23))
* only ts ([6430263](https://gitlab.com/stream-machine/api-definitions/commit/64302639ebe15e510c746abd3824721b1419b6d3))
* only ts ([73ce508](https://gitlab.com/stream-machine/api-definitions/commit/73ce508751d406a696f56c9e4d5010241383873f))
* small tweaks ([937c76f](https://gitlab.com/stream-machine/api-definitions/commit/937c76f9381fd42db7b5a3166b2768beed15aa32))
* small tweaks ([5119224](https://gitlab.com/stream-machine/api-definitions/commit/511922423c309704c5693961a66c3aa4cd4d3744))
* small tweaks ([bb34d4c](https://gitlab.com/stream-machine/api-definitions/commit/bb34d4cbb721cd1cdd029e37816823b92d67c38b))
* workaround ([8caa433](https://gitlab.com/stream-machine/api-definitions/commit/8caa433d90dfacc8d164616010655bdfb59e3770))


### Features

* added grpc-web with typescript ([fffbbe5](https://gitlab.com/stream-machine/api-definitions/commit/fffbbe5fb47ef7bfda27538f7c95d7fcca441fd4))
* added grpc-web with typescript ([136d919](https://gitlab.com/stream-machine/api-definitions/commit/136d919617b7f833b91371f06f2a246157a1dd40))

# [1.22.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.21.0...v1.22.0) (2021-09-23)


### Features

* **account:** add legacy billing id rpc ([b84bca6](https://gitlab.com/stream-machine/api-definitions/commit/b84bca664cadd94800bd16179ab7aa784c3ff47a))

# [1.21.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.20.0...v1.21.0) (2021-09-20)


### Features

* add billing_id to AccountService requests ([ab9c663](https://gitlab.com/stream-machine/api-definitions/commit/ab9c6630ff232437a12b3c066b3e81cbdd162ffe))

# [1.20.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.19.0...v1.20.0) (2021-09-20)


### Features

* added account service ([4d56622](https://gitlab.com/stream-machine/api-definitions/commit/4d56622893c0306c3a7112dfdbdb5d903eacbe01))

# [1.19.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.18.0...v1.19.0) (2021-08-24)


### Features

* add metadata and search to Schemas and EventContracts ([86233f3](https://gitlab.com/stream-machine/api-definitions/commit/86233f3d918df4db8405448360c9476007a06805))

# [1.18.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.17.0...v1.18.0) (2021-08-13)


### Features

* **jvm:** add proto tools to Kotlin api definitions artifact ([b920020](https://gitlab.com/stream-machine/api-definitions/commit/b92002051654b27cdef7b844d11b9f6a6e3f1498))

# [1.17.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.16.0...v1.17.0) (2021-08-02)


### Features

* added metadata for schemas and event contracts for use in portal ([e3ee7b1](https://gitlab.com/stream-machine/api-definitions/commit/e3ee7b177aad7952447007559e1a1a182c62029d))

# [1.16.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.15.0...v1.16.0) (2021-07-29)


### Bug Fixes

* add deprecated to schema_type in SchemaRef ([42b6450](https://gitlab.com/stream-machine/api-definitions/commit/42b6450a1be668e1f6bde181b826ffd487daf5cc))
* add programming language to GetSchemaCodeRequest ([d9666de](https://gitlab.com/stream-machine/api-definitions/commit/d9666de8283cd335efb03cdefb69612bcba58b51))
* removed schema_type as this can be resolved internally ([d2c9af6](https://gitlab.com/stream-machine/api-definitions/commit/d2c9af6cb55af572764e58a7ab8c8353a260a020))


### Features

* add GetSchemaCode RPC ([baff7d8](https://gitlab.com/stream-machine/api-definitions/commit/baff7d8e69254d3607cdc8a886c7f1a240d633fe))

# [1.15.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.14.0...v1.15.0) (2021-07-16)


### Features

* **schema:** added fingerprint ([95ce382](https://gitlab.com/stream-machine/api-definitions/commit/95ce382da10ba99a4c0452fd007d233cb75b780a))

# [1.14.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.13.0...v1.14.0) (2021-07-15)


### Bug Fixes

* **python:** force commit to pypi ([4d97f6a](https://gitlab.com/stream-machine/api-definitions/commit/4d97f6aed360bd650b69cef41bdfb17f70eb943b))


### Features

* **python:** add steps to publish public api definitions for python to pypi ([2dc2b94](https://gitlab.com/stream-machine/api-definitions/commit/2dc2b942bb92c07218706e39fe808ed239e80341))

# [1.13.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.12.0...v1.13.0) (2021-07-15)


### Bug Fixes

* buf breaking disabled ([32f752f](https://gitlab.com/stream-machine/api-definitions/commit/32f752f72d2c14d743ba7d63a4be89679a71988a))


### Features

* **schemas:** return confluent_id in schemas/get ([c008b4c](https://gitlab.com/stream-machine/api-definitions/commit/c008b4caab8c6a096407fb03123353c2ebee1cef))

# [1.12.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.11.0...v1.12.0) (2021-07-06)


### Features

* trigger a pipeline ([d35fb85](https://gitlab.com/stream-machine/api-definitions/commit/d35fb85dde6665cbd9ea714243335f5718035b4e))

# [1.11.0](https://gitlab.com/stream-machine/api-definitions/compare/v1.10.0...v1.11.0) (2021-07-06)


### Bug Fixes

* golang package path stuff ([d15fb13](https://gitlab.com/stream-machine/api-definitions/commit/d15fb13c28d943f79ccc20e04198a2192487a4df))
* **go:** fix go_package path ([e61bcdc](https://gitlab.com/stream-machine/api-definitions/commit/e61bcdccc9340c546266b791c4564b0ea112ecdc))
* fix go_package module for proto ([f20b122](https://gitlab.com/stream-machine/api-definitions/commit/f20b12252d1717095fa62e3bcfacbe52ef493a1a))


### Features

* create a version env file top level ([c74d801](https://gitlab.com/stream-machine/api-definitions/commit/c74d801f66e783038edd9a1b1eed172d31ed2c4e))
* **ci:** add python publish tasks in CI ([53f1320](https://gitlab.com/stream-machine/api-definitions/commit/53f1320f7a549e9e099c7c1c74c650d1a47d4f81))
* **python:** python code gen works and is published to GAR ([7e41cf0](https://gitlab.com/stream-machine/api-definitions/commit/7e41cf0fd18a6d2f21b2e5217c906c2bb44bffbd))
* introduce multi language; makefiles to generate all ([9f6072f](https://gitlab.com/stream-machine/api-definitions/commit/9f6072f2908ec2ce84aad2c7558b44bd568fae08))
* **go:** make go ([36ed301](https://gitlab.com/stream-machine/api-definitions/commit/36ed301102d4ffee31d52bbadd01b014b2d3db33))
* **health:** add gRPChealth check ([6c0a211](https://gitlab.com/stream-machine/api-definitions/commit/6c0a21140a7689b98c185923d430d3ff5af089a5))
* **health:** add gRPChealth check ([d2b92d4](https://gitlab.com/stream-machine/api-definitions/commit/d2b92d40206d8b09e22523e49f72cb609b3b6457))
* **health:** add gRPChealth check ([1c7f895](https://gitlab.com/stream-machine/api-definitions/commit/1c7f895a7adffb315473fa682b04554236401b8c))
* **health:** add gRPChealth check ([3e9b23e](https://gitlab.com/stream-machine/api-definitions/commit/3e9b23e6aa38d8d16f001c79a9ce1fcafb0c2858))

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
