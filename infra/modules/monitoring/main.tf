# =============================================================================
# modules/monitoring — observability backbone.
# Provisions Log Analytics workspace + Application Insights (workspace-based) +
# an action group and a starter metric alert. Every other resource sends its
# telemetry here, giving the platform its Operational Excellence story.
# =============================================================================

# TODO(milestone 2): azurerm_log_analytics_workspace
# TODO(milestone 2): azurerm_application_insights (workspace_id = above)
# TODO(milestone 2): azurerm_monitor_action_group (email receiver)
# TODO(milestone 2): azurerm_monitor_metric_alert (e.g. function failures > 0)
