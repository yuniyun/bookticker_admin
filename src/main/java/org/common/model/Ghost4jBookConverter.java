package org.common.model;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

import org.ghost4j.document.PDFDocument;
import org.ghost4j.renderer.SimpleRenderer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

/**
 * Example showing how to render pages of a PDF document using the high level
 * API.
 * 
 */
public class Ghost4jBookConverter {

	private static final Logger logger = LoggerFactory.getLogger(Ghost4jBookConverter.class);

	public int convertToIMG(String bookSeries, String bookName, String bookVersion) {

		int totalPage = 0;
		logger.info("loading ghost4j");

		String path = "C:\\unioracle\\3r_card\\image\\" + bookSeries + "\\" + bookName + "\\" + bookVersion + "\\";
		
		try {
			// load PDF document
			PDFDocument document = new PDFDocument();

			// example \\unioracle\3r_card\PDF\�̾߱� �ø���\�̾߱�\1.0\�̾߱�.pdf
			File pdfSrc = new File("C:\\unioracle\\3r_card\\pdf\\" + bookSeries
					+ "\\" + bookName + "\\" + bookVersion + "\\" + bookName
					+ ".pdf");

			document.load(pdfSrc);

			if (!pdfSrc.exists()) {
				logger.info("not found PDF file for convert");
				return -1;
			}

			// dir check and mkdir
			logger.info("make file folder");
			File dir1 = new File("C:\\unioracle\\3r_card\\image\\" + bookSeries);
			if (!dir1.exists()) {
				dir1.mkdir();
			}

			File dir2 = new File("C:\\unioracle\\3r_card\\image\\" + bookSeries
					+ "\\" + bookName);
			if (!dir2.exists()) {
				dir2.mkdir();
			}

			File dir3 = new File("C:\\unioracle\\3r_card\\image\\" + bookSeries
					+ "\\" + bookName + "\\" + bookVersion);
			if (!dir3.exists()) {
				dir3.mkdir();
			}

			int pageCutSize = 50;

			totalPage = document.getPageCount();
			logger.info("�� ������ ��: " + totalPage);
			int refor = document.getPageCount() / pageCutSize;

			// create renderer
			SimpleRenderer renderer = new SimpleRenderer();
			logger.info("ready for rendering");

			// set resolution (in DPI)
			renderer.setResolution(200);
			logger.info("set resolution 200");

			for (int j = 1; j <= refor + 1; j++) {
				logger.info("" + j);

				int start = (j - 1) * pageCutSize;
				int end = j * pageCutSize - 1;

				if (end > document.getPageCount())
					end = document.getPageCount();
				
				// rendering
				List<Image> images = renderer.render(document, start, end);
				logger.info("50 buffer rendering");

				// convert to PNG
				try {
					// example \\UNIORACLE\3r_card\IMAGE\�̾߱� �ø���\�̾߱�\1.0\1.png
					for (int i = 0; i < images.size(); i++) {
						ImageIO.write((RenderedImage) images.get(i), "png",
								new File(path + (start + i + 1) + ".png"));
						logger.info(start + i + 1 + " page is done");
					}
				} catch (IOException e) {
					logger.info("IO_ERROR: " + e.getMessage());
					return -1;
				}

			}
		} catch (Exception e) {
			logger.info("GENERIC_ERROR: " + e.getMessage());
			return -1;
		}
		
		logger.info("Finished convert");
		
		makeThumbnail(path);
		makeShadow(path, totalPage);
		return totalPage;
	}
	
	public void makeThumbnail(String path) {
		try {
			BufferedImage image1 = ImageIO.read(new File(path + "1.png")); //å�̹���
			BufferedImage image2 = ImageIO.read(new File("C:\\unioracle\\3r_card\\UTIL\\inshadow.png"));  //���α׸���
			BufferedImage image3 = ImageIO.read(new File("C:\\unioracle\\3r_card\\UTIL\\outshadow.png")); //�ֱܺ׸���

			int width = image3.getWidth(); //��ȭ�� ����ũ��
			int height = image3.getHeight(); //��ȭ�� ����ũ��
			
			BufferedImage mergedImage = new BufferedImage(width, height,BufferedImage.TYPE_INT_ARGB); //��ȭ�� ����
			Graphics2D graphics = (Graphics2D) mergedImage.getGraphics(); //�����غ�

			graphics.drawImage(image3, 0, 0, null); //�������� ��ȭ���� �ܺα׸��ڸ� ��������
			graphics.drawImage(image1, 0, 0, image2.getWidth(), image2.getHeight(), null); //�������� ��ȭ���� å�̹����� ����
			graphics.drawImage(image2, 0, 0, null); //�������� ��ȭ���� ���α׸��ڸ� ����.  �� ���ܰ�� ���伥 ���̾ �����غ���ɵ�
			graphics.setComposite(AlphaComposite.Clear); //��ȭ���� å�̹������� ũ�⶧����(�ܺα׸���ó������) ����κ��� ������� ���´�. �׺κ��� ����ȭ
			ImageIO.write(mergedImage, "png", new File(path + "thumbnail.png")); //������,����
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		logger.info("Finished make thumbnail");
	}
	public void makeShadow(String path, int totalPage) {
		try {
			for(int i = 2; i<totalPage; i++){
	            BufferedImage page = ImageIO.read(new File(path + i + ".png")); //å�̹���
	            BufferedImage shadow = null;
	            if(i%2 == 1){
	            	shadow = ImageIO.read(new File("C:\\unioracle\\3r_card\\UTIL\\rightpage.png")); //Ȧ�� �� ��� ������
	            }else{
	            	shadow = ImageIO.read(new File("C:\\unioracle\\3r_card\\UTIL\\leftpage.png")); //�ֱܺ׸���	            	
	            }
	         
	            int width = shadow.getWidth(); //��ȭ�� ����ũ��
	            int height = shadow.getHeight(); //��ȭ�� ����ũ��
	            BufferedImage img = new BufferedImage(width, height,BufferedImage.TYPE_INT_ARGB); //��ȭ�� ����
	            Graphics2D graphicsodd = (Graphics2D) img.getGraphics(); //�����غ�
	            graphicsodd.drawImage(page, 0, 0,width,height, null); //�������� ��ȭ���� �ܺα׸��ڸ� ��������
	            graphicsodd.drawImage(shadow, 0, 0, null);
	            graphicsodd.setComposite(AlphaComposite.Clear);
	            ImageIO.write(img, "png", new File(path + i + ".png"));
	         }
		} catch (IOException ioe) {
	         ioe.printStackTrace();
	    }
		logger.info("Finished make shadow file");
	 }
}
