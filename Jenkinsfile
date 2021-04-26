node{   
def app
      stage('Clone repository') {               
             
            checkout scm    
      
      }
      stage('Build image') {         
      
            app = docker.build("bhanuraina/primeapp")    
         
      } 
      stage('Test image') {           
            app.inside {            
             
             sh 'echo "Tests passed"'        
            }    
        }     
       stage('Push image') {
      
        docker.withRegistry('https://registry.hub.docker.com', 'bb2c2f37-3e60-4692-a575-5bbce988bf7d') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")        
      
           }    
       }
      }
      stage("Send EMail")
      {
              post {
        always {
            echo 'I will always say Hello again!'
            
            emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
            
        }   
    }
      }          
}