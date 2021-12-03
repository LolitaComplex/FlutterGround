class InheritedTestEntity {

  InheritedTestEntity() : this.clone(null);

  InheritedTestEntity.clone(InheritedTestEntity? source) {
    if(source != null) {
      this._isFromOuterPage = source.currentInnerPage;
      this._isFromInnerPage = source.currentInnerPage;
    }
  }

  int _isFromOuterPage = -1;
  int _isFromInnerPage = -1;

  int get currentOuterPage => _isFromOuterPage;
  int get currentInnerPage => _isFromInnerPage;

  set fromOuterPage(int fromOuterPage) =>
      _isFromOuterPage = fromOuterPage;

  set fromInnerPage(int fromInnerPage) =>
      _isFromInnerPage = fromInnerPage;

}