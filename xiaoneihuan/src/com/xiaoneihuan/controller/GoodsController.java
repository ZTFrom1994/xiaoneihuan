package com.xiaoneihuan.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.mapping.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.xiaoneihuan.domain.Goods;
import com.xiaoneihuan.domain.Image;
import com.xiaoneihuan.service.interfaces.GoodsServiceInter;
import com.xiaoneihuan.service.interfaces.ImagesServiceInter;

@Controller
public class GoodsController {

	@Autowired
	private GoodsServiceInter goodsServiceInter;
	@Autowired
	private ImagesServiceInter imagesServiceInter;

	private static int pageNow = 1;
	private static int pageSize = 18;
	private static int pageCount = 1;
	private static String tempSearchText = "";
	private static String tempSearchBy = "";
	private List<String> imageList = new ArrayList<String>();
	@RequestMapping(value = "getGoods")
	public String getGoods(HttpSession httpSession, String action,
			String direction, String pageNumber, String searchText,
			String searchBy) {
		List<Goods> goodsList = null;
		if (searchText != null) {
			tempSearchText = searchText;
		} else {
			tempSearchBy = "";
		}

		if (searchBy != null) {
			tempSearchBy = searchBy;
		} else {
			tempSearchBy = "";
		}

		if (action != null && !action.equals("")) {
			// 查找动作
			if (action.equals("search")) {
				if (!tempSearchBy.equals("")) {
					if (!tempSearchText.equals("")) {
						// 如果有关键字输入，分类查找
						if (tempSearchBy.equals("goodsTitle")) {
							goodsList = goodsServiceInter
									.findGoodsByTitleWithPage(tempSearchText,
											pageNow, pageSize);
						} else if (tempSearchBy.equals("mainClass")) {
							goodsList = goodsServiceInter
									.findGoodsByMainClassWithPage(
											tempSearchText, pageNow, pageSize);
						} else if (tempSearchBy.equals("subClass")) {
							goodsList = goodsServiceInter
									.findGoodsBySubClassWithPage(
											tempSearchText, pageNow, pageSize);
						}
					} else {
						// 没关键字输入，分类排序
						if (tempSearchBy.equals("publishTime")) {
							pageNow = 1;
							goodsList = goodsServiceInter
									.findGoodsByPublishTimeWithPage(pageNow,
											pageSize);
						} else if (tempSearchBy.equals("endDate")) {
							goodsList = goodsServiceInter
									.findGoodsByGoodDealWithPage(pageNow,
											pageSize);
						} else if (tempSearchBy.equals("clickRate")) {
							goodsList = goodsServiceInter
									.findGoodsByClickTimesWithPage(pageNow,
											pageSize);
						} else {
							System.out.println("s_search_by无法识别");
						}
					}
				} else {
					// 没有指定排序或查找方式,按关键字查找
					pageNow = 1;
					tempSearchBy = "";
					goodsList = goodsServiceInter.findGoodsByKeyWordWithPage(
							tempSearchText, pageNow, pageSize);
				}
			} else if (action.equals("changePage")) { // 换页动作
				if (direction != null) {
					if (direction.equals("front")) {// 前一页
						if (pageNow - 1 >= 1) {
							pageNow -= 1;
						}
					} else if (direction.equals("back")) { // 下一页
						if (pageNow + 1 <= pageCount) {
							pageNow += 1;
						}
					}
				} else {
					// 跳页
					if (pageNumber != null) {
						pageNow = Integer.parseInt(pageNumber);
					} else {
						pageNow = 1;
					}
				}
				if (tempSearchBy != null && !tempSearchBy.equals("")) {
					if (tempSearchBy.equals("publishTime")) {
						goodsList = goodsServiceInter
								.findGoodsByPublishTimeWithPage(pageNow,
										pageSize);
						pageCount = goodsServiceInter.getPageCount(pageSize);
					} else if (tempSearchBy.equals("goodsTitle")) {
						goodsList = goodsServiceInter.findGoodsByTitleWithPage(
								tempSearchText, pageNow, pageSize);
						pageCount = goodsServiceInter.getPageCount(pageSize);
					} else if (tempSearchBy.equals("mainClass")) {
						goodsList = goodsServiceInter
								.findGoodsByMainClassWithPage(tempSearchText,
										pageNow, pageSize);
						pageCount = goodsServiceInter.getPageCount(pageSize);
					} else if (tempSearchBy.equals("subClass")) {
						goodsList = goodsServiceInter
								.findGoodsBySubClassWithPage(tempSearchText,
										pageNow, pageSize);
						pageCount = goodsServiceInter.getPageCount(pageSize);
					} else if (tempSearchBy.equals("goodDeal")) {
						goodsList = goodsServiceInter
								.findGoodsByGoodDealWithPage(pageNow, pageSize);
						pageCount = goodsServiceInter.getPageCount(pageSize);
					} else if (tempSearchBy.equals("clickRate")) {
						goodsList = goodsServiceInter
								.findGoodsByClickTimesWithPage(pageNow, pageSize);
					} else {
						System.out.println("search_by无法识别");
					}
				} else {// 没有searchBy
					goodsList = goodsServiceInter.findGoodsByPublishTimeWithPage(pageNow,pageSize);
				}
			} else {
				System.out.println("action动作无法识别");
			}
		} else {
			goodsList = goodsServiceInter.findGoodsByPublishTimeWithPage(pageNow,pageSize);
		}

		//ArrayList<Image> images = null;
		if (goodsList != null) {
//			map = new LinkedHashMap<Goods, ArrayList<Image>>();
//			for (int i = 0; i < goodsList.size(); i++) {
//				Goods goods = goodsList.get(i);
//				images = (ArrayList<Image>) imagesServiceInter
//						.getImageByGoodsId(goods.getGoodsId());
//				map.put(goods, images);
//			}
			// System.out.println("map size:"+map.size()+"goods list size:"+goodsList.size()+"image list size"+images.size());
			httpSession.setAttribute("goodsList",goodsList);
			pageCount = goodsServiceInter.getPageCount(pageSize);
			httpSession.setAttribute("pageCount", pageCount);

		}
		return "main";
	}

	@RequestMapping(value = "getPageNow")
	@ResponseBody
	public String getPageNow() {
		return ("a" + pageNow);
	}

	@RequestMapping(value = "toPublishGoods")
	@ResponseBody
	public String toPublishGoods(HttpSession httpSession) throws Exception {
		if (httpSession.getAttribute("logged") != null
				&& httpSession.getAttribute("logged").equals("y"))
			return "1";
		else
			return "0";
	}

	@RequestMapping(value = "goPublish")
	public String goPublish() {
		return "publishgoods";
	}

	@RequestMapping(value = "goGoodsShow")
	public String goGoodsShow() {
		return "goodsshow";
	}

	@RequestMapping(value = "goClicksHandle")
	public String clicksHandle(HttpSession session, int id) {
		Goods goods = goodsServiceInter.findUniqueGoodById(id);
		if (goods != null) {
			goods.setClicks(goods.getClicks() + 1);
			goodsServiceInter.update(goods);
			session.setAttribute("goods", goods);
			return "redirect:./goGoodsShow";
		} else {
			System.out.println("[clickHandle]goods==null");
			return "error";
		}
	}

	@RequestMapping(value = "publishGoods")
	@ResponseBody
	public String publishGoods(HttpSession httpSession, String title,
			String intro, String mainClass, String subClass,
			String contactName, String contactNumber, String qqNumber,
			String condition, String fromSchool, String city) {
		String username = (String) httpSession.getAttribute("currentUser");
		ArrayList<String> al = (ArrayList<String>) httpSession
				.getAttribute("oneGoodsImgList");
		if (al != null && al.size() != 0) {
			Goods goods = new Goods();
			goods.setClicks(0);
			goods.setConditions(condition);
			goods.setContactName(contactName);
			goods.setContactNumber(contactNumber);
			goods.setDealStatus("寻求交易");
			goods.setFromSchool(fromSchool);
			goods.setGoodsTitle(title);
			goods.setQqNumber(qqNumber);
			goods.setSubClass(subClass);
			goods.setMainClass(mainClass);
			goods.setCity(city);
			goods.setPublishDate(new Date());
			goods.setIntroduction(intro);
			goods.setPublisher(username);
			goodsServiceInter.add(goods);
			for (int i = 0; i < al.size(); i++) {
				Image image = new Image();
				image.setGoods(goods);
				image.setSrc(al.get(i).toString());
				imagesServiceInter.add(image);
			}
			imageList.clear();
			return "1";
		} else {
			return "0";
		}
	}

	@RequestMapping(value = "/updateGoodsStatus")
	@ResponseBody
	public String updateGoodsStatus(int id, String status) {
		Goods g = goodsServiceInter.updateGoodsStatus(id, status);
		if (g != null) {
			g.setEndDate(new Date());
			goodsServiceInter.update(g);
			return g.getDealStatus();
		} else {
			return "0";
		}
	}

	@RequestMapping("upload")
	@ResponseBody
	public void webPhotoUpload(HttpServletRequest request, HttpSession session) {
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			String u = (String) request.getSession()
					.getAttribute("currentUser");

			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				// 数据封装操作 MultipartFile reqeust
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				// 取得当前上传文件的文 件名称
				String[] surfix = file.getOriginalFilename().split("\\.");
				UUID uuid = UUID.randomUUID();
				String myFileName = sdf.format(new Date()) + uuid + "."
						+ surfix[1]; // 这里需要你对文件的处理哦
				imageList.add("file\\" + myFileName);
				try {
					String path = request.getSession().getServletContext()
							.getRealPath("/")
							+ "file\\";
					File targetFile = new File(path, myFileName);
					file.transferTo(targetFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			session.setAttribute("oneGoodsImgList", imageList);
		}
	}
}
