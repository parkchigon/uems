function _UEMS_Native() {

	this.uploadImage = function(siteId, chkMonth, msId, msqId, subFacilityId){
		return window.UMES.uploadImage(siteId, chkMonth, msId, msqId, subFacilityId);
	};
}

var UEMS_Native = new _UEMS_Native();
