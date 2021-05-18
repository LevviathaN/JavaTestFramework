package ui.utils.pdf;

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//


import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

import com.testautomationguru.utility.CompareMode;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.pdf.ImageUtil;
import org.apache.commons.io.FileUtils;
import org.apache.pdfbox.cos.COSName;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPageTree;
import org.apache.pdfbox.pdmodel.PDResources;
import org.apache.pdfbox.pdmodel.graphics.PDXObject;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;

public class PDFUtil {
    private String imageDestinationPath;
    private boolean bTrimWhiteSpace = true;
    private boolean bHighlightPdfDifference = false;
    private Color imgColor;
    private boolean bCompareAllPages;
    private CompareMode compareMode;
    private String[] excludePattern;
    private int startPage = 1;
    private int endPage = -1;

    public PDFUtil() {
        this.imgColor = Color.RED;
        this.bCompareAllPages = false;
        this.compareMode = CompareMode.TEXT_MODE;
        System.setProperty("sun.java2d.cmm", "sun.java2d.cmm.kcms.KcmsServiceProvider");
    }

    public void setCompareMode(CompareMode mode) {
        this.compareMode = mode;
    }

    public CompareMode getCompareMode() {
        return this.compareMode;
    }

    public void trimWhiteSpace(boolean flag) {
        this.bTrimWhiteSpace = flag;
    }

    public String getImageDestinationPath() {
        return this.imageDestinationPath;
    }

    public void setImageDestinationPath(String path) {
        this.imageDestinationPath = path;
    }

    public void highlightPdfDifference(boolean flag) {
        this.bHighlightPdfDifference = flag;
    }

    public void highlightPdfDifference(Color colorCode) {
        this.bHighlightPdfDifference = true;
        this.imgColor = colorCode;
    }

    public void compareAllPages(boolean flag) {
        this.bCompareAllPages = flag;
    }

    public int getPageCount(String file) throws IOException {
        BPPLogManager.getLogger().info("file :" + file);
        PDDocument doc = PDDocument.load(new File(file));
        int pageCount = doc.getNumberOfPages();
        BPPLogManager.getLogger().info("pageCount :" + pageCount);
        doc.close();
        return pageCount;
    }

    public String getText(String file) throws IOException {
        return this.getPDFText(file, -1, -1);
    }

    public String getText(String file, int startPage) throws IOException {
        return this.getPDFText(file, startPage, -1);
    }

    public String getText(String file, int startPage, int endPage) throws IOException {
        return this.getPDFText(file, startPage, endPage);
    }

    private String getPDFText(String file, int startPage, int endPage) throws IOException {
        BPPLogManager.getLogger().info("file : " + file);
        PDDocument doc = PDDocument.load(new File(file));
        PDFTextStripper stripper = new PDFTextStripper();
        this.updateStartAndEndPages(file, startPage, endPage);
        stripper.setStartPage(this.startPage);
        stripper.setEndPage(this.endPage);
        String txt = stripper.getText(doc);
        if (this.bTrimWhiteSpace) {
            txt = txt.trim().replaceAll("\\s+", " ").trim();
            BPPLogManager.getLogger().info("PDF Text after  trimming : " + txt);
        }

        doc.close();
        return txt;
    }

    public void excludeText(String... regexs) {
        this.excludePattern = regexs;
    }

    public boolean compare(String file1, String file2) throws IOException {
        return this.comparePdfFiles(file1, file2, -1, -1);
    }

    public boolean compare(String file1, String file2, int startPage, int endPage) throws IOException {
        return this.comparePdfFiles(file1, file2, startPage, endPage);
    }

    public boolean compare(String file1, String file2, int startPage) throws IOException {
        return this.comparePdfFiles(file1, file2, startPage, -1);
    }

    private boolean comparePdfFiles(String file1, String file2, int startPage, int endPage) throws IOException {
        return CompareMode.TEXT_MODE == this.compareMode ? this.comparepdfFilesWithTextMode(file1, file2, startPage, endPage) : this.comparePdfByImage(file1, file2, startPage, endPage);
    }

    private boolean comparepdfFilesWithTextMode(String file1, String file2, int startPage, int endPage) throws IOException {
        String file1Txt = this.getPDFText(file1, startPage, endPage).trim();
        String file2Txt = this.getPDFText(file2, startPage, endPage).trim();
        if (null != this.excludePattern && this.excludePattern.length > 0) {
            for (int i = 0; i < this.excludePattern.length; ++i) {
                file1Txt = file1Txt.replaceAll(this.excludePattern[i], "");
                file2Txt = file2Txt.replaceAll(this.excludePattern[i], "");
            }
        }

        BPPLogManager.getLogger().info("File 1 Txt : " + file1Txt);
        BPPLogManager.getLogger().info("File 2 Txt : " + file2Txt);
        boolean result = file1Txt.equalsIgnoreCase(file2Txt);
        if (!result) {
            BPPLogManager.getLogger().warn("PDF content does not match");
        }

        return result;
    }

    public List<String> savePdfAsImage(String file, int startPage) throws IOException {
        return this.saveAsImage(file, startPage, -1);
    }

    public List<String> savePdfAsImage(String file, int startPage, int endPage) throws IOException {
        return this.saveAsImage(file, startPage, endPage);
    }

    public List<String> savePdfAsImage(String file) throws IOException {
        return this.saveAsImage(file, -1, -1);
    }

    private List<String> saveAsImage(String file, int startPage, int endPage) throws IOException {
        BPPLogManager.getLogger().info("file : " + file);
        BPPLogManager.getLogger().info("startPage : " + startPage);
        BPPLogManager.getLogger().info("endPage : " + endPage);
        ArrayList imgNames = new ArrayList();

        try {
            File sourceFile = new File(file);
            this.createImageDestinationDirectory(file);
            this.updateStartAndEndPages(file, startPage, endPage);
            String fileName = sourceFile.getName().replace(".ui.utils.pdf", "");
            PDDocument document = PDDocument.load(sourceFile);
            PDFRenderer pdfRenderer = new PDFRenderer(document);

            for (int iPage = this.startPage - 1; iPage < this.endPage; ++iPage) {
                BPPLogManager.getLogger().info("Page No : " + (iPage + 1));
                String fname = this.imageDestinationPath + fileName + "_" + (iPage + 1) + ".png";
                BufferedImage image = pdfRenderer.renderImageWithDPI(iPage, 400.0F, ImageType.RGB);
                ImageIOUtil.writeImage(image, fname, 400);
                imgNames.add(fname);
                BPPLogManager.getLogger().info("PDf Page saved as image : " + fname);
            }

            document.close();
        } catch (Exception var12) {
            var12.printStackTrace();
        }

        return imgNames;
    }

    public boolean compare(String file1, String file2, int startPage, int endPage, boolean highlightImageDifferences, boolean showAllDifferences) throws IOException {
        this.compareMode = CompareMode.VISUAL_MODE;
        this.bHighlightPdfDifference = highlightImageDifferences;
        this.bCompareAllPages = showAllDifferences;
        return this.comparePdfByImage(file1, file2, startPage, endPage);
    }

    private boolean comparePdfByImage(String file1, String file2, int startPage, int endPage) throws IOException {
        BPPLogManager.getLogger().info("file1 : " + file1);
        BPPLogManager.getLogger().info("file2 : " + file2);
        int pgCount1 = this.getPageCount(file1);
        int pgCount2 = this.getPageCount(file2);
        if (pgCount1 != pgCount2) {
            BPPLogManager.getLogger().warn("files page counts do not match - returning false");
            return false;
        } else {
            if (this.bHighlightPdfDifference) {
                this.createImageDestinationDirectory(file2);
            }

            this.updateStartAndEndPages(file1, startPage, endPage);
            return this.convertToImageAndCompare(file1, file2, this.startPage, this.endPage);
        }
    }

    private boolean convertToImageAndCompare(String file1, String file2, int startPage, int endPage) throws IOException {
        boolean result = true;
        PDDocument doc1 = null;
        PDDocument doc2 = null;
        PDFRenderer pdfRenderer1 = null;
        PDFRenderer pdfRenderer2 = null;

        try {
            doc1 = PDDocument.load(new File(file1));
            doc2 = PDDocument.load(new File(file2));
            pdfRenderer1 = new PDFRenderer(doc1);
            pdfRenderer2 = new PDFRenderer(doc2);

            for (int iPage = startPage - 1; iPage < endPage; ++iPage) {
                //String fileName = (new File(file1)).getName().replace(".ui.utils.pdf", "_") + (iPage + 1);
                String fileName = Reporter.getCurrentTestName() + "_" + (iPage + 1);
                fileName = this.getImageDestinationPath() + "/" + fileName + "_diff.png";
                BPPLogManager.getLogger().info("Comparing Page No: " + (iPage + 1));
                BufferedImage image1 = pdfRenderer1.renderImageWithDPI(iPage, 400.0F, ImageType.RGB);
                BufferedImage image2 = pdfRenderer2.renderImageWithDPI(iPage, 400.0F, ImageType.RGB);
                result = ImageUtil.compareAndHighlight(image1, image2, fileName, this.bHighlightPdfDifference, this.imgColor.getRGB()) && result;
                if (!this.bCompareAllPages && !result) {
                    break;
                }
            }
        } catch (Exception var17) {
            var17.printStackTrace();
        } finally {
            doc1.close();
            doc2.close();
        }

        return result;
    }

    public List<String> extractImages(String file, int startPage) throws IOException {
        return this.extractimages(file, startPage, -1);
    }

    public List<String> extractImages(String file, int startPage, int endPage) throws IOException {
        return this.extractimages(file, startPage, endPage);
    }

    public List<String> extractImages(String file) throws IOException {
        return this.extractimages(file, -1, -1);
    }

    private List<String> extractimages(String file, int startPage, int endPage) {
        BPPLogManager.getLogger().info("file : " + file);
        BPPLogManager.getLogger().info("startPage : " + startPage);
        BPPLogManager.getLogger().info("endPage : " + endPage);
        ArrayList<String> imgNames = new ArrayList();
        boolean bImageFound = false;

        try {
            this.createImageDestinationDirectory(file);
            String fileName = this.getFileName(file).replace(".ui.utils.pdf", "_resource");
            PDDocument document = PDDocument.load(new File(file));
            PDPageTree list = document.getPages();
            this.updateStartAndEndPages(file, startPage, endPage);
            int totalImages = 1;

            for (int iPage = this.startPage - 1; iPage < this.endPage; ++iPage) {
                BPPLogManager.getLogger().info("Page No : " + (iPage + 1));
                PDResources pdResources = list.get(iPage).getResources();
                Iterator var12 = pdResources.getXObjectNames().iterator();

                while (var12.hasNext()) {
                    COSName c = (COSName) var12.next();
                    PDXObject o = pdResources.getXObject(c);
                    if (o instanceof PDImageXObject) {
                        bImageFound = true;
                        String fname = this.imageDestinationPath + "/" + fileName + "_" + totalImages + ".png";
                        ImageIO.write(((PDImageXObject) o).getImage(), "png", new File(fname));
                        imgNames.add(fname);
                        ++totalImages;
                    }
                }
            }

            document.close();
            if (bImageFound) {
                BPPLogManager.getLogger().info("Images are saved @ " + this.imageDestinationPath);
            } else {
                BPPLogManager.getLogger().info("No images were found in the PDF");
            }
        } catch (Exception var16) {
            var16.printStackTrace();
        }

        return imgNames;
    }

    private void createImageDestinationDirectory(String file) throws IOException {
        if (null == this.imageDestinationPath) {
            File sourceFile = new File(file);
            String destinationDir = sourceFile.getParent() + "/temp/";
            this.imageDestinationPath = destinationDir;
            this.createFolder(destinationDir);
        }

    }

    private boolean createFolder(String dir) throws IOException {
        FileUtils.deleteDirectory(new File(dir));
        return (new File(dir)).mkdir();
    }

    private String getFileName(String file) {
        return (new File(file)).getName();
    }

    private void updateStartAndEndPages(String file, int start, int end) throws IOException {
        PDDocument document = PDDocument.load(new File(file));
        int pagecount = document.getNumberOfPages();
        BPPLogManager.getLogger().info("Page Count: " + pagecount);
        BPPLogManager.getLogger().info("Given start page:" + start);
        BPPLogManager.getLogger().info("Given end page:" + end);
        if (start > 0 && start <= pagecount) {
            this.startPage = start;
        } else {
            this.startPage = 1;
        }

        if (end > 0 && end >= start && end <= pagecount) {
            this.endPage = end;
        } else {
            this.endPage = pagecount;
        }

        document.close();
        BPPLogManager.getLogger().info("Updated start page:" + this.startPage);
        BPPLogManager.getLogger().info("Updated end   page:" + this.endPage);
    }
}

