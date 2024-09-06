output "elasticsearch_endpoint" {
  description = "The endpoint of the Elasticsearch domain"
  value       = module.elasticsearch.endpoint
}

output "kibana_endpoint" {
  description = "The endpoint of the Kibana instance"
  value       = module.kibana.endpoint
}