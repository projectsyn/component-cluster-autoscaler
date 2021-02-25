local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.cluster_autoscaler;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('cluster-autoscaler', params.namespace);

{
  'cluster-autoscaler': app,
}
