package com.defa.model.core;

import java.util.List;

public class Right {
    private Integer rightId;

    private String rightUrl;

    private Integer upperRightId;

    private String rightName;

    private Integer menuId;

    private String description;

    private Integer status;
    
    private Menu menu;
    
    private Integer checked;
    private Integer subChecked;
    
    public Integer getChecked() {
		return checked;
	}

	public void setChecked(Integer checked) {
		this.checked = checked;
	}

	public Integer getSubChecked() {
		return subChecked;
	}

	public void setSubChecked(Integer subChecked) {
		this.subChecked = subChecked;
	}

	private List<Right> subRights;
    
    public List<Right> getSubRights() {
		return subRights;
	}

	public void setSubRights(List<Right> subRights) {
		this.subRights = subRights;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

    public Integer getRightId() {
        return rightId;
    }

    public void setRightId(Integer rightId) {
        this.rightId = rightId;
    }

    public String getRightUrl() {
        return rightUrl;
    }

    public void setRightUrl(String rightUrl) {
        this.rightUrl = rightUrl == null ? null : rightUrl.trim();
    }

    public Integer getUpperRightId() {
        return upperRightId;
    }

    public void setUpperRightId(Integer upperRightId) {
        this.upperRightId = upperRightId;
    }

    public String getRightName() {
        return rightName;
    }

    public void setRightName(String rightName) {
        this.rightName = rightName == null ? null : rightName.trim();
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}