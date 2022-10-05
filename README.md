# IRIS-ECP-CPF
One of a CPF merger example.  
ECP Clients + ECP Server + WebGwateway(as load balancer).

## prep

```
git clone --recursive https://github.com/IRISMeister/iris-ecp-cpf.git
cd iris-ecp-cpf
cp Dockerfile.fhir iris-fhir-template/Dockerfile
```

Install docker compose plugin.

```bash
$ sudo apt-get update
$ sudo apt-get install docker-compose-plugin
```

Place valid iris.key under license/ .

## To build
```
# docker compose build
```
## To run
```
# docker compose up -d
```

## To access portals
http://localhost:52773/csp/sys/%25CSP.Portal.Home.zen
http://localhost:52774/csp/sys/%25CSP.Portal.Home.zen
http://localhost:52775/csp/sys/%25CSP.Portal.Home.zen

Use _SYSTEM / SYS as a credential.

http://localhost:8080/csp/bin/Systems/Module.cxw

Use CSPSystem / SYS as a credential.

## App endpoint

```
http://localhost:8080/api/monitor/metrics
```

FHIR Server
```
curl http://localhost:52780/fhir/r4/Patient/1
```


## To stop/run
```
# docker compose stop
# docker compose start
```
## To completely remove (including databases)
```
# docker compose down
```
