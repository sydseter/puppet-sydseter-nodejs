cmd_/vagrant/puppet/modules/nodejs/files/node/out/Release/mksnapshot.x64 := flock /vagrant/puppet/modules/nodejs/files/node/out/Release/linker.lock g++ -pthread -rdynamic -m64 -m64 -Wl,--gc-sections  -o /vagrant/puppet/modules/nodejs/files/node/out/Release/mksnapshot.x64 -Wl,--start-group /vagrant/puppet/modules/nodejs/files/node/out/Release/obj.target/mksnapshot.x64/deps/v8/src/mksnapshot.o /vagrant/puppet/modules/nodejs/files/node/out/Release/obj.target/deps/v8/tools/gyp/libv8_base.x64.a /vagrant/puppet/modules/nodejs/files/node/out/Release/obj.target/deps/v8/tools/gyp/libv8_nosnapshot.x64.a -Wl,--end-group -lrt