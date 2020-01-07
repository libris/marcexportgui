<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.io.IOException" %>
<%!
    private static final String PROFILE_DIR = "ProfileDir";
    private static final String HOME_DIR = "HomeDir";

    public Properties loadProfile(String name) throws IOException {
        return loadProperties(getProfileFile(name));
    }

    void storeProfile(Properties profile) throws IOException {
        String profileName = profile.getProperty("name");
        try (OutputStream output = new FileOutputStream(getProfileFile(profileName))) {
            profile.store(output, null);
        }
    }

    public Properties loadExportGuiProperties() throws IOException {
        return loadProperties(new File(application.getRealPath("/exportgui.properties")));
    }

    public Properties loadProperties(File file) throws IOException {
        Properties properties = new Properties();
        try (InputStream inputStream = new FileInputStream(file)) {
            properties.load(inputStream);
        }
        return properties;
    }

    public Map loadAllProfiles() throws IOException {
        File files[] = getProfilesDir().listFiles();

        Map<String, java.util.Properties> fileMap = new TreeMap<>();
        for (java.io.File f : files) {
            if (f.getName().endsWith(".properties")) {
                Properties properties = loadProperties(f);
                fileMap.put(properties.getProperty("longname"), properties);
            }
        }

        return fileMap;
    }

    public void storeJob(Properties job) throws IOException {
        String jobId = "" + (int) (java.lang.Math.random() * 1000000);

        try (OutputStream output = new FileOutputStream(getJobFile(jobId))) {
            job.store(output, null);
        }
    }

    public File getProfileFile(String profileName) throws IOException {
        return new File(getProfilesDir(), profileName + ".properties");
    }

    public File getProfilesDir() throws IOException {
        return new File(loadExportGuiProperties().getProperty(PROFILE_DIR));
    }

    public File getJobFile(String jobId) throws IOException {
        return new File (getJobsDir(), jobId);
    }

    public File getJobsDir() throws IOException {
        return new File(loadExportGuiProperties().getProperty(HOME_DIR) + "/jobs/incoming");
    }

    public File getExportDir(String profileName) throws IOException {
        return new File(loadExportGuiProperties().getProperty(HOME_DIR) + "/files/" + profileName + "/marc");
    }

    public File getLogDir(String profileName) throws IOException {
        return new File(loadExportGuiProperties().getProperty(HOME_DIR) + "/files/" + profileName + "/logs");
    }
%>