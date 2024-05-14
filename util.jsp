<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="java.util.Comparator" %>
<%!
    private static final String PROFILE_DIR = "ProfileDir";
    private static final String HOME_DIR = "HomeDir";

    public class Store {
        String profileDir;
        String homeDir;
        String adminPassword;

        public Store(ServletContext application) throws IOException {
            Properties p = loadProperties(new File(application.getRealPath("/WEB-INF/exportgui.properties")));
            profileDir = p.getProperty(PROFILE_DIR);
            homeDir = p.getProperty(HOME_DIR);
            adminPassword = p.getProperty("password");
        }

        public Properties loadProfile(String name) throws IOException {
            return loadProperties(getProfileFile(name));
        }

        void storeProfile(Properties profile) throws IOException {
            String name = profile.getProperty("name");
            storeProperties(profile, getProfileFile(name));
        }

        public Map loadAllProfiles() throws IOException {
            File files[] = getProfilesDir().listFiles();

            Map<String, Properties> profiles = new TreeMap<String, Properties>(new Comparator<String>() {
                @Override
                public int compare(String s1, String s2) {
                    return s1 != null ? s1.compareToIgnoreCase(s2) : 0;
                }
            });

            for (File f : files) {
                if (f.getName().endsWith(".properties")) {
                    Properties profile = loadProperties(f);
                    profiles.put(profile.getProperty("longname"), profile);
                }
            }

            return profiles;
        }

        public void storeJob(Properties job) throws IOException {
            String jobId = "" + (int) (Math.random() * 1000000);
            storeProperties(job, getJobFile(jobId));
        }

        public File getProfileFile(String profileName) {
            return new File(getProfilesDir(), profileName + ".properties");
        }

        public File getProfilesDir() {
            return new File(profileDir);
        }

        public File getJobFile(String jobId) {
            return new File(getJobsDir(), jobId);
        }

        public File getJobsDir() {
            return new File(homeDir + "/jobs/incoming");
        }

        public File getExportDir(String profileName) {
            return new File(homeDir + "/files/" + profileName + "/marc");
        }

        public File getLogDir(String profileName) {
            return new File(homeDir + "/files/" + profileName + "/logs");
        }

        public String getAdminPassword() {
            return adminPassword;
        }
    }

    public Store getStore(ServletContext application) throws IOException {
        return new Store(application);
    }

    public static Properties loadProperties(File file) throws IOException {
        Properties properties = new Properties();

        InputStream input = new FileInputStream(file);
        try {
            properties.load(input);
        } finally {
            input.close();
        }

        return properties;
    }

    private static void storeProperties(Properties properties, File file) throws IOException {
        OutputStream output = new FileOutputStream(file);
        try {
            properties.store(output, null);
        } finally {
            output.close();
        }
    }
%>
