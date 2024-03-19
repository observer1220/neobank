package mail

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/techschool/simplebank/util"
)

func TestSendEmailWithGmail(t *testing.T) {
	// 只有在設置short標籤時才會跳過此測試
	if testing.Short() {
		t.Skip()
	}

	config, err := util.LoadConfig("..")
	require.NoError(t, err)

	sender := NewGmailSender(config.EmailSenderName, config.EmailSenderAddress, config.EmailSenderPassword)

	subject := "Neo Bank 測試信件"
	content := `
	<h1>Hello world</h1>
	<p>This is a test message from bibi</p>
	`
	to := []string{"observer1220@gmail.com", "duckchang7@gmail.com"}
	attachFiles := []string{"../README.md"}

	err = sender.SendEmail(subject, content, to, nil, nil, attachFiles)
	require.NoError(t, err)
}
