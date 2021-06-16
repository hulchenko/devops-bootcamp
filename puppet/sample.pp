node 'puppet.us-east-2.compute.internal' {
package{ 'httpd' :
ensure=> installed,
}
}