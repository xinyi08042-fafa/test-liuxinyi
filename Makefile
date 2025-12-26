include $(TOPDIR)/rules.mk

PKG_NAME:=gl-mt6000-default-settings
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=xinyi08042-fafa<xinyi.liu@gl-inet.com>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/gl-mt6000-default-settings
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=GL.iNet MT6000 Default Settings
  PKGARCH:=all
endef

define Package/gl-mt6000-default-settings/description
  This package provides default settings for GL.iNet MT6000 router.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/gl-mt6000-default-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/set-default-setting.sh $(1)/etc/uci-defaults/99-gl-mt6000-defaults
endef

$(eval $(call BuildPackage,gl-mt6000-default-settings))
