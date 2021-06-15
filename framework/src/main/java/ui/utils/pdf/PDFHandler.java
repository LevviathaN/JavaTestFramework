package ui.utils.pdf;

import com.testautomationguru.utility.CompareMode;
//import com.testautomationguru.utility.PDFUtil;
import ui.utils.Reporter;
import ui.utils.SeleniumHelper;
import ui.utils.bpp.PreProcessFiles;

import java.io.IOException;


public class PDFHandler {

    private static final String fileUploadPath = PreProcessFiles.QUARK_FILES_FOLDER_PATH;
    private static final String downloadedFilesPath = PreProcessFiles.DOWNLOADED_FILES_FOLDER_PATH;
    static PDFUtil pdfUtil = new PDFUtil();

    public static boolean checkPDF(String file1, String file2) throws IOException {
        String fileOne = fileUploadPath + "/" + file1;
        String fileTwo = downloadedFilesPath + "/" + file2;
        boolean comparison = true;

        pdfUtil.compareAllPages(true);
        pdfUtil.setCompareMode(CompareMode.TEXT_MODE);

        comparison = pdfUtil.compare(fileOne, fileTwo);
        pdfUtil.setImageDestinationPath(Reporter.getQuarkImagesFolder());
        pdfUtil.highlightPdfDifference(true);
        if (comparison != true) {
            pdfUtil.setCompareMode(CompareMode.VISUAL_MODE);
            pdfUtil.compare(fileOne, fileTwo);
            Reporter.fail("PDF COMPARISON FAILED!Please Check PDF Differences Folder");
       } else {
            Reporter.log("Text comparison for PDF files is completed successfully! No differences found!Performing visual comparison....");
            pdfUtil.setCompareMode(CompareMode.VISUAL_MODE);
            pdfUtil.compare(fileOne, fileTwo);
        }
        return comparison;
    }

    public static String getPageCountBaseFile(String fileName) throws IOException {
        return String.valueOf(pdfUtil.getPageCount(fileUploadPath + "/" + fileName));
    }

    public static String getPageCountDownloadedFile(String fileName) throws IOException {
        return String.valueOf(pdfUtil.getPageCount(downloadedFilesPath + "/" + fileName));
    }

    public static String checkPdf(String fileName) throws IOException {
        fileName = SeleniumHelper.driver().getCurrentUrl();
        pdfUtil.setCompareMode(CompareMode.TEXT_MODE);
        pdfUtil.getText(fileName);
        return fileName;
    }
}
