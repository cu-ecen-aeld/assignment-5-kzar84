
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDSOCKET_VERSION = '43ab714251e74cf27949ce36f57b0518213348f8'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDSOCKET_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-kzar84.git'
AESDSOCKET_SITE_METHOD = git
AESDSOCKET_GIT_SUBMODULES = YES

define AESDSOCKET_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# Add aesdsocket and start-stop script
define AESDSOCKET_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/s99aesdsocket
endef

$(eval $(generic-package))
