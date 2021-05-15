package edu.hebeu.util;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import edu.hebeu.entity.Student;
import jdk.internal.org.objectweb.asm.commons.AnalyzerAdapter;

public class StudentListener extends AnalysisEventListener<Student> {
    /**
     *
     * @param o
     * @param analysisContext
     */

    public void invoke(Student student, AnalysisContext analysisContext) {
        System.out.println(student);
    }

    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
