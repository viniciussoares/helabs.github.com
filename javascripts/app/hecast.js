var HEcast = {
  StartApp: function() {
    this.InterfaceActions();
  },

  InterfaceActions: function() {
    $('.contact-form').validate({
      rules: {
        Field2: {
          required: true,
          email: true
        }
      },
      messages: {
        Field1: App.I18n.t('Field1'),
        Field2: App.I18n.t('Field2'),
        Field7: App.I18n.t('Field7')
      }
    });
  }
}
