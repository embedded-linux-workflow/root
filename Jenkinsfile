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

'''
        archiveArtifacts '/home/rpi-user/linux/arch/arm/boot/\'*\''
      }
    }

  }
}