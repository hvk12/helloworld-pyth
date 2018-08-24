#### Step 1 - Build a container

The local docker image was built on a vm of ubuntu18 running on a windows 7
host machine.

Initially the image was built and tested locally
Command to run locally
sudo  docker run -p 5000:5000
and using web browser
http://localhost:5000/

The image was built and pushed to the github using AWS code build, reason being to automate the process. 

The git hub repo is
[github repo](https://github.com/hvk12/helloworld-pyth)
    **Dockerfile** - the docker file to build the image 
    [dockerfile](https://github.com/hvk12/helloworld-pyth/blob/master/Dockerfile)
    **buildspec.yml** - the build spec for AWS Code build project to build the docker image and publish to Docker hub repository
    [buildspec.yml](https://github.com/hvk12/helloworld-pyth/blob/master/buildspec.yml)    
        ***Environment variables*** used to build (passed as parameters in the aws code build project)
            - **IMAGE_REPO_NAME**  hk2812/helloworld-pyth (Repository 	name where the docker image resides)
            - **IMAGE_TAG**  - latest
            - **DOCKER_HUB_USERNAME** - hk2812 ( Userid to login to dockerhub)
            
  ***Parameter store*** (AWS provides storage to store secrets)   
         - used the Command 
  

    aws ssm put-parameter --name "github_cred" --value <password value>" --type String
         

 retrieval as [parameterstore](https://github.com/hvk12/helloworld-pyth/blob/master/buildspec.yml#L4) in buildspec.yml 


#### 3 Deployment
 For testing/poc purpose, created a EKS cluster on my trial account and deployed on the eks cluster
          [deployment.yml](https://github.com/hvk12/helloworld-pyth/blob/master/deployment.yml)
 

     sudo kubectl create -f deployment.yml
	  sudo kubectl apply -f deployment.yml
