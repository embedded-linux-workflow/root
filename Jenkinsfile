pipeline {
  agent {
    dockerfile {
      filename 'file'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''echo Building
export KERNEL=kernel7l
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
printenv
cd /home/rpi-user/linux
make bcm2711_defconfig
make
cp arch/arm/boot/zImage $WORKSPACE
cp arch/arm/boot/dts/*.dtb $WORKSPACE
cp arch/arm/boot/dts/overlays/*.dtb* $WORKSPACE
cp arch/arm/boot/dts/overlays/README  $WORKSPACE
'''
        archiveArtifacts 'install.sh'
      }
    }

  }
}