pipeline {
    agent {
        label{
            label "built-in"
            customWorkspace "/mnt/vsk"
            
        }
    }
    
    stages {
        stage ("clone-repo") {
            steps {
                sh "rm -rf /mnt/vsk/*" 
				sh "git clone https://github.com/varshabhalerao7/loginwebapp.git"
            }
           }
           stage ("create-build") {
               steps { 
                   dir ('/mnt/vsk/loginwebapp') {
                   sh "mvn clean install"
                   }
               }
           }
           stage ("chmod") {
               steps { 
                   dir ('/mnt/vsk/loginwebapp/target') {
                   sh "chmod -R 777 LoginWebApp.war"
                   }
               }
             } 
stage ('copy-container') {
        steps{

     dir ('/mnt/vsk/loginwebapp') {
         sh "docker build -t myimage-01"
         sh "docker run --don01 -itdp 708:8080 myimage-01"

     }
        }
    }
}
}
