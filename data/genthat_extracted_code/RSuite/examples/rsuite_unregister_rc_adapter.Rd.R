library(RSuite)


### Name: rsuite_unregister_rc_adapter
### Title: Unregisters RC (revision control) adapter.
### Aliases: rsuite_unregister_rc_adapter

### ** Examples

rc_adapter <- rc_adapter_create_base("Own") # create your custom adapter
class(rc_adapter) <- c("rc_adapter_own", class(rc_adapter))

# register it
rsuite_register_rc_adapter(rc_adapter)

# unregister it
rsuite_unregister_rc_adapter("Own")




