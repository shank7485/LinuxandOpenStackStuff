Routing requests to kubernetes nodes in AWS:

1. Route53 entry which maps a DNS CNAME record to the ELB loadbalancer AWS URL.
2. On the loadbalancer, add a listener rule which forward requests received on the loadbalancer to a target group.
3. Now, this target group needs to be created. The target group will basically route requests to a specific port the registered targets and also do health checks on a specific port and /url endpoint. 
4. Now, the registered targets are auto scaling group instances. To link the new target group created with the ASG instances, the target group name needs to be added in the ASG configuration. That way both are linked together.
5. Once this is done, on going back to the target groups, the health checks should pass as requests will now start hitting the ASG instances.
6. Now looking at the instances as kubernetes nodes, whatever API we want to expose to this Route53 / loadbalancer, that needs to exposed as Nodeport service in kubernetes. That way, any request which hits the ASG instances gets routed to the nodeport which in turn hits the API endpoint.
7. When all these done and health checks pass, the requests flow will look like: curl to DNS -> route53 load balancer lookup -> loadbalancer -> target group -> ASG instances -> kubernetes API Pod nodeport -> API running inside Pod.

With istio ingress, the concept is similar where instead of API being exposed as nodeport directory, they are just exposed at cluster level as cluster port to the istio ingress so that all requests to the API running Pod are routed through the istio ingress. This way, istio ingress can control the routes to these Pods and hence can be managed centrally. 

Now the requests flow will look like:
curl to DNS -> route53 load balancer lookup -> loadbalancer -> target group -> ASG instances -> kubernetes Istio Ingress Pod nodeport -> istio ingress Pod -> API running inside Pod.
