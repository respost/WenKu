<?php
/**
 * 文档控制器基类
 *
 * @author andery
 */
class docbaseAction extends frontendAction {

    public function _initialize(){
        parent::_initialize();
        //按照更新时间顺序
    }
    public function search(){
    }

    /**
     * word转pdf
     * @param $docPath
     * @param $pdfPath
     */
    public function doc_to_pdf($docPath, $pdfPath){
        $result=false;
        try {
            if(!file_exists($docPath)){
                return;
            }
            $word = new \COM("word.application") or die("Can't start Word!");
            $word->Visible=0;
            $word->Documents->Open($docPath, false, false, false, "1", "1", true);
            $word->ActiveDocument->final = false;
            $word->ActiveDocument->Saved = true;
            $word->ActiveDocument->ExportAsFixedFormat(
                $pdfPath,
                17,                         // wdExportFormatPDF
                false,                      // open file after export
                0,                          // wdExportOptimizeForPrint
                3,                          // wdExportFromTo
                1,                          // begin page
                5000,                       // end page
                7,                          // wdExportDocumentWithMarkup
                true,                       // IncludeDocProps
                true,                       // KeepIRM
                1                           // WdExportCreateBookmarks
            );
            $word->ActiveDocument->Close();
            $word->Quit();
            $result=true;
        } catch (\Exception $e) {
            if (method_exists($word, "Quit")){
                $word->Quit();
            }
            $result=false;
        }
        return $result;
    }

    /**
     * excel转pdf
     * @param $excelPath
     * @param $pdfPath
     */
    public function excel_to_pdf($excelPath,$pdfPath) {
        $result=false;
        try {
            if(!file_exists($excelPath)){
                return;
            }
            $excel = new \COM("excel.application") or die("Unable to instantiate excel");
            $workbook = $excel->Workbooks->Open($excelPath, null, false, null, "1", "1", true);
            $workbook->ExportAsFixedFormat(0, $pdfPath);
            $workbook->Close();
            $excel->Quit();
            $result=true;
        } catch (\Exception $e) {
            echo ("src:$excelPath catch exception:" . $e->__toString());
            if (method_exists($excel, "Quit")){
                $excel->Quit();
            }
            $result=false;
        }
        return $result;
    }

    /**
     * ppt转pdf
     * @param $pptPath
     * @param $pdfPath
     */
    public function ppt_to_pdf($pptPath,$pdfPath) {
        $result=false;
        try {
            if(!file_exists($pptPath)){
                return;
            }
            $ppt = new \COM("powerpoint.application") or die("Unable to instantiate Powerpoint");
            $presentation = $ppt->Presentations->Open($pptPath, false, false, false);
            $presentation->SaveAs($pdfPath,32,1);
            $presentation->Close();
            $ppt->Quit();
            $result=true;
        } catch (\Exception $e) {
            if (method_exists($ppt, "Quit")){
                $ppt->Quit();
            }
            $result=false;
        }
        return $result;
    }

    /**
     * word、excel、ppt转换成pdf
     * @param $doc_url
     * @param $output_url
     */
    public function word2pdf($doc_url, $output_url){
        //Invoke the OpenOffice.org service manager
        $osm = new COM("com.sun.star.ServiceManager") or die ("Please be sure that OpenOffice.org is installed.\n");
        //Set the application to remain hidden to avoid flashing the document onscreen
        $args = array($this->MakePropertyValue("Hidden",true,$osm));
        //Launch the desktop
        $top = $osm->createInstance("com.sun.star.frame.Desktop");
        //Load the .doc file, and pass in the "Hidden" property from above
        $oWriterDoc = $top->loadComponentFromURL($doc_url,"_blank", 0, $args);
        //Set up the arguments for the PDF output
        $export_args = array($this->MakePropertyValue("FilterName","writer_pdf_Export",$osm));
        //Write out the PDF
        $oWriterDoc->storeToURL($output_url,$export_args);
        $oWriterDoc->close(true);
    }
    public function MakePropertyValue($name,$value,$osm){
        $oStruct = $osm->Bridge_GetStruct("com.sun.star.beans.PropertyValue");
        $oStruct->Name = $name;
        $oStruct->Value = $value;
        return $oStruct;
    }
}