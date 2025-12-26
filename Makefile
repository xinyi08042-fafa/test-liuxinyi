include $(TOPDIR)/rules.mk

PKG_NAME:=gl-mt6000-default-settings
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Your Name <your.email@example.com>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/gl-mt6000-default-settings
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=GL.iNet MT6000 Default Settings
  DEPENDS:=+openssl-util
  PKGARCH:=all
endef

define Package/gl-mt6000-default-settings/description
  This package provides default settings for GL.iNet MT6000 router,
  including WiFi SSID (gl-inet/gl-inet-5G) and default password (goodlife).
  
  The settings will be automatically applied on first boot.
endef

define Build/Configure
	# Nothing to configure
endef

define Build/Compile
	# Nothing to compile
endef

define Package/gl-mt6000-default-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/set-default-settings.sh $(1)/etc/uci-defaults/99-gl-mt6000-defaults
endef

define Package/gl-mt6000-default-settings/postinst
#!/bin/sh
# Check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
    echo "GL.iNet MT6000 default settings package installed."
    echo "Settings will be applied on next boot."
    echo "You can also run manually: /etc/uci-defaults/99-gl-mt6000-defaults"
fi
exit 0
endef

define Package/gl-mt6000-default-settings/prerm
#!/bin/sh
# Clean up when package is removed
if [ -z "$${IPKG_INSTROOT}" ]; then
    echo "Removing GL.iNet MT6000 default settings..."
    rm -f /etc/gl-defaults-applied
fi
exit 0
endef

$(eval $(call BuildPackage,gl-mt6000-default-settings))
