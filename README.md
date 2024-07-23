### Building
You'll need to get familiar with [Git and Repo](https://source.android.com/source/using-repo.html) as well as [How to build a GSI](https://github.com/phhusson/treble_experimentations/wiki/How-to-build-a-GSI%3F).

## Sync GitHub repo
Run the following:
```bash
git clone https://github.com/cawilliamson/treble_voltage.git
cd treble_everest/
```

## Patch Script
- ```sh patches/apply.sh [rootdir] [patchdirname]``` 
- ```sh patches/apply.sh [rootdir] [patchdirname] --reset``` to reset a patch directory to default. RESETS ENTIRE DIR!!!
- ```sh patches/apply.sh [rootdir] [patchdirname/specificpatchdir]``` to only apply a certain patchset ie: trebledroid/platform_frameworks_base

Replace `<arch>` with `arm64` or `arm32_binder64` and `<variant>` with `vanilla`, `gapps`, or `microg`.

## Troubleshooting
If you face any conflicts while applying patches, apply the patch manually.
For any other issues, report them via the [Issues](https://github.com/cawilliamson/treble_voltage/issues) tab.

## Credits
These people have helped this project in some way or another, so they should be the ones who receive all the credit:
- [Chris AW](https://github.com/cawilliamson/treble_voltage)
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
