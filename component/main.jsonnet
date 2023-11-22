// main template for cluster-autoscaler
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local prom = import 'lib/prometheus.libsonnet';
// The hiera parameters for the component
local params = inv.parameters.cluster_autoscaler;

local namespace = kube.Namespace(params.namespace);

{
  '00_namespace':
    if std.member(inv.applications, 'prometheus') then
      prom.RegisterNamespace(namespace)
    else
      namespace,
}
