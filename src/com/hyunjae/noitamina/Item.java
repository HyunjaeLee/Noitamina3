package com.hyunjae.noitamina;

public class Item implements Comparable<Item>{
	
	private String title = "";
	private String url = "";
	private String src = "";
    private boolean isNew = false;
	
	public Item(String title, String url, String src) {
		super();
		this.title = title;
		this.url = url;
		this.src = src;
	}

    public Item() {
        super();
    }

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getSrc() {
		return src;
	}
	
	public void setSrc(String src) {
		this.src = src;
	}

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean aNew) {
        isNew = aNew;
    }
	
	@Override
	public int compareTo(Item o) {
		return this.title.compareTo(o.getTitle());
	}

    @Override
    public String toString() {
        return title;
    }

}
