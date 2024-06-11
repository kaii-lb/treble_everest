### Building
You'll need to get familiar with [Git and Repo](https://source.android.com/source/using-repo.html) as well as [How to build a GSI](https://github.com/phhusson/treble_experimentations/wiki/How-to-build-a-GSI%3F).

## Sync GitHub repo
Run the following:
```bash
git clone https://github.com/cawilliamson/treble_voltage.git
cd treble_voltage/
```

## Build ALL variants and upload to GitHub
Run the following:
```bash
./build-all.sh
```

## Build one variant and store in out/
Run the following:
```bash
./build-image.sh "<arch>" "<variant>"
```

Replace `<arch>` with `arm64` or `arm32_binder64` and `<variant>` with `vanilla`, `gapps`, or `microg`.

## Troubleshooting
If you face any conflicts while applying patches, apply the patch manually.
For any other issues, report them via the [Issues](https://github.com/cawilliamson/treble_voltage/issues) tab.

# What patches don't work
### empty string means look for more issues

- platform_bionic 0002
- platform_bootable_recovery 0001
- platform_build doesn't seem to be a git repo
- platform_frameworks_av 
- platform_frameworks_base 
- platform_frameworks_opt_net_ims 
- platform_frameworks_opt_telephony
- platform_packages_modules_Bluetooth
- platform_packages_modules_Connectivity
- platform_system_bpf
- platform_system_core
- pre/platform_packages_modules_Bluetooth 0001 0002

## Credits
These people have helped this project in some way or another, so they should be the ones who receive all the credit:
- [VoltageOS Team](https://github.com/VoltageOS)
- [Phhusson](https://github.com/phhusson)
- [AndyYan](https://github.com/AndyCGYan)
- [Ponces](https://github.com/ponces)
- [Peter Cai](https://github.com/PeterCxy)
- [Iceows](https://github.com/Iceows)
- [ChonDoit](https://github.com/ChonDoit)
- [Nazim](https://github.com/naz664)
- [UniversalX](https://github.com/orgs/UniversalX-devs/)
- [TQMatvey](https://github.com/TQMatvey)
