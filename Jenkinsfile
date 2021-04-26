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
      stage("Send EMail")
      {
              notifyStarted();
      }          
}
def notifyStarted() {

  // send to email
  emailext (
      subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
      recipientProviders: [[$class: 'DevelopersRecipientProvider']]
    )
}
