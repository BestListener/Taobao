package cn.edu.zhku.she.Util;

import java.util.List;

@SuppressWarnings("rawtypes")
public class PageBean {
	private int curPage;	//  ��ǰҳ��
	private int totalPages; //  ��ҳ��
	private int dataSize;   //  ��������
	private int pageSize;	//  ÿҳ��ʾ����
	private int btnSize;    //  ��ʾ�İ�ť��
	private List data;		//  ���ݼ���
	public int getCurPage() {
		if( curPage > getTotalPages() ){
			curPage = getTotalPages();
		}else if( curPage < 1 )
		{
			curPage = 1;
		}
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalPages() {
		if( dataSize % pageSize == 0 )
		{
			totalPages = dataSize / pageSize;
		}else{
			totalPages = dataSize / pageSize + 1;
		}
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getDataSize() {
		return dataSize;
	}
	public void setDataSize(int dataSize) {
		this.dataSize = dataSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBtnSize() {
		return btnSize;
	}
	public void setBtnSize(int btnSize) {
		this.btnSize = btnSize;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	
}
