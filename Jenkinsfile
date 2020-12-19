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
export WORKSPACE=/home/rpi-user/linux
printenv
cd /home/rpi-user/linux
make bcm2711_defconfig
pwd
ls arch/arm/boot/
'''
        archiveArtifacts 'linux/arch/arm/boot/install.sh'
      }
    }

  }
}